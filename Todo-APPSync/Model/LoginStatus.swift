//
//  LoginStatus.swift
//  Todo-APPSync
//
//  Created by YuHan Hsiao on 2020/12/28.
//

import Foundation
import Combine

class LoginState: ObservableObject {
    static let shared = LoginState()
    @Published var isLoggedIn = true
    @Published var subId = ""
}
