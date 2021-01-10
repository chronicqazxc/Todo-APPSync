//
//  AppDelegate.swift
//  UserDevice
//
//  Created by YuHan Hsiao on 2020/11/29.
//

import Foundation
import AWSMobileClient

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        AWSMobileClient.default().initialize { state, error in
            AWSMobileClient.default().setCredentialsProvider(AWSMobileClient.default())
            if case .signedIn = state {
                LoginState.shared.isLoggedIn = true
            } else {
                LoginState.shared.isLoggedIn = false
            }
        }
        return true
    }
}
