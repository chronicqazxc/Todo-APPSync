//
//  LoginView.swift
//  UserDevice
//
//  Created by YuHan Hsiao on 2020/11/29.
//

import SwiftUI
import AWSMobileClient

struct LoginView: View {
    
    @State var username: String
    @State var password: String
    @EnvironmentObject var loginState: LoginState
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text("username")
                    TextField("username", text: $username)
                }
                HStack {
                    Text("password")
                    TextField("password", text: $password)
                }
                Button("Login") {
                    AWSMobileClient.default().signIn(username: username, password: password) { state, error in
                        if case .signedIn = state?.signInState {
                            DispatchQueue.main.async {
                                loginState.isLoggedIn = true
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        } else if case .newPasswordRequired = state?.signInState {
                            
                            AWSMobileClient.default().confirmSignIn(challengeResponse: password) { result, error in
                                print(result ?? error!)
                                DispatchQueue.main.async {
                                    loginState.isLoggedIn = true
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            }
                        }
                    }
                }.frame(width: 100, height: 40, alignment: .center)
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(username: "", password: "")
    }
}
