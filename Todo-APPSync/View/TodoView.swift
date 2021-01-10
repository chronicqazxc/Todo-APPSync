//
//  TodoView.swift
//  Todo-APPSync
//
//  Created by YuHan Hsiao on 2020/12/28.
//

import SwiftUI

private struct TodoKey: EnvironmentKey {
    static let defaultValue: Todo = Todo(id: "", task: "", isFinished: false, date: Date())
}

extension EnvironmentValues {
    var todo: Todo {
        get { self[TodoKey.self] }
        set { self[TodoKey.self] = newValue }
    }
}

struct TodoView: View {
    
    @Environment(\.todo) var todo: Todo
    var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM-d-yyyy HH:mm"
        return formatter
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: TaskView(todo: todo)) {
                if todo.isFinished {
                    Text(todo.task)
                        .strikethrough()
                    Text(formatter.string(from: todo.taskDate))
                        .strikethrough()
                } else {
                    Text(todo.task)
                    Text(formatter.string(from: todo.taskDate))
                }
            }
        }
    }
}

struct TaskView: View {
    @State var isFinished: Bool = false
    @State private var taskValue: String = ""
    @State var todo: Todo
    @State var buttonDisable: Bool = true
    @EnvironmentObject var modelData: ModelData
    @State private var wakeUp = Date()
    
    var body: some View {
        Form {
            TextField(
                "task",
                text: $taskValue, onCommit: {
                    let newTodo = Todo(id: todo.id, task: taskValue, isFinished: isFinished, date: wakeUp)
                    AppSync.shared.modifyTodo(newTodo)
                })
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .onAppear {
                    taskValue = todo.task
                }
            DatePicker("Schedule", selection: $wakeUp)
                .onAppear(perform: {
                    wakeUp = todo.taskDate
                })
            Toggle(isOn: $isFinished) {
                Text("Is finished")
            }
            .onAppear {
                isFinished = todo.isFinished
            }
        }
        .navigationTitle("Edit")
        
        Button("Confirm") {
            
            let newTodo = Todo(id: todo.id, task: taskValue, isFinished: isFinished, date: wakeUp)
            AppSync.shared.modifyTodo(newTodo)
            buttonDisable = true
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                            to: nil,
                                            from: nil,
                                            for: nil)
        }
        .disabled(buttonDisable)
        .padding()
        .onChange(of: isFinished, perform: { value in
            buttonDisable = (todo.isFinished == value) ? true : false
        })
        .onChange(of: taskValue, perform: { value in
            buttonDisable = (todo.task == value) ? true : false
        })
        .onChange(of: wakeUp, perform: { value in
            buttonDisable = (Int(todo.taskDate.timeIntervalSince1970) == Int(value.timeIntervalSince1970)) ? true : false
        })
    }
}
