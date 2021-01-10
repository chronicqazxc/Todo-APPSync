//
//  ContentView.swift
//  Todo-APPSync
//
//  Created by YuHan Hsiao on 2020/12/27.
//

import SwiftUI
import AWSAppSync
import AWSMobileClient

struct ContentView: View {
    
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var loginState: LoginState
    
    @State private var showPopUp = false
    @State private var wakeUp = Date()
    
    var body: some View {
        if loginState.isLoggedIn == true {
            NavigationView {
                ZStack {
                    List {
                        Section(header: Text("SubId")) {
                            Text(loginState.subId)
                                .minimumScaleFactor(0.01)
                        }
                        
                        Section(header: Text("Todos")) {
                            ForEach(modelData.todos) { todo in
                                TodoView()
                                    .environment(\.todo, todo)
                            }
                            .onDelete(perform: { indexSet in
                                let todo = self.modelData.todos[indexSet.first!]
                                AppSync.shared.removeTodo(todo)
                                
                                modelData.todos.removeAll(where: { $0.id == todo.id })
                                modelData.todos.sort { lhs, rhs -> Bool in
                                    lhs.taskDate < rhs.taskDate
                                }
                            })
                        }
                        
                    }
                    .listStyle(InsetGroupedListStyle())
                    .environment(\.horizontalSizeClass, .regular)
                    .navigationBarTitle("TodoList-AppSync")
                    .navigationBarItems(leading: addTodoButton(),
                                        trailing: logoutButton())
                }
            }.onAppear(perform: onAppear)
        } else {
            LoginView(username: "", password: "")
                .environmentObject(loginState)
        }
         
    }
    
    func onAppear() {
        AWSMobileClient.default().initialize { (userState, error) in
            if UserDefaults.standard.bool(forKey: "HasInstalled") == false {
                UserDefaults.standard.set(true, forKey: "HasInstalled")
            } else if userState == .signedIn {
                let pool = AWSCognitoIdentityUserPool.default()
                let user = pool.currentUser()
                user?.getDetails().continueWith(block: { task -> Any? in
                    guard let result = task.result else {
                        return nil
                    }
                    let response: AWSCognitoIdentityUserGetDetailsResponse = result
                    let subId = response.userAttributes!.filter {
                        $0.name == "sub"
                    }.first
                    AppSync.shared.setupAppSyncWithSubId(subId!.value!)
                    AppSync.shared.delegate = self
                    DispatchQueue.main.async {
                        self.loginState.subId = subId!.value!
                    }
                    self.listDevice()
                    return nil
                })
            }
        }
        
    }
    
    func listDevice() {
        AppSync.shared.listTodos { result in
            if case let .success(devices) = result {
                modelData.todos = devices
                modelData.todos.sort { lhs, rhs -> Bool in
                    lhs.taskDate < rhs.taskDate
                }
            }
        }
    }

    func logoutButton() -> some View {
        Button("Sign out") {
            AWSMobileClient.default().signOut { _ in
                DispatchQueue.main.async {
                    self.loginState.isLoggedIn = false
                }
            }
        }
    }
    
    @State var newTodoTask: String = ""
    
    func addTodoButton() -> some View {
        Button("Add todo") {
            self.showPopUp = true
        }.sheet(isPresented: self.$showPopUp, onDismiss: {
            newTodoTask = ""
            wakeUp = Date()
        }, content: {
            HStack {
                Spacer()
                Button(action: {
                    self.showPopUp = false
                }, label: {
                    Text("Close")
                })
                .frame(alignment: .trailing)
            }
            .padding()
            
            Form {
                Text("New Todo")
                    .font(.title)
                TextField("Task", text: $newTodoTask)
                DatePicker("Schedule", selection: $wakeUp)
            }
            Button(action: {
                let todo = Todo(id: UUID().uuidString,
                                task: newTodoTask,
                                isFinished: false,
                                date: wakeUp)
                AppSync.shared.createTodo(todo)
                self.showPopUp = false
            }, label: {
                Text("Add")
            })
            .padding()
        })
    }
}

extension ContentView: AppSyncDelegate {
    func onTodoCreated(_ todo: Todo) {
        modelData.todos.append(todo)
        modelData.todos.sort { lhs, rhs -> Bool in
            lhs.taskDate < rhs.taskDate
        }
    }
    
    func onTodoDeleted(_ todo: Todo) {
        guard modelData.todos.contains(todo) else {
            return
        }
        modelData.todos.removeAll(where: { $0.id == todo.id })
        modelData.todos.sort { lhs, rhs -> Bool in
            lhs.taskDate < rhs.taskDate
        }
    }
    
    func onTodoUpdated(_ todo: Todo) {
        modelData.todos.removeAll {
            $0.id == todo.id
        }
        modelData.todos.append(todo)
        modelData.todos.sort { lhs, rhs -> Bool in
            lhs.taskDate < rhs.taskDate
        }
    }
    
    func reconnected() {
        listDevice()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
