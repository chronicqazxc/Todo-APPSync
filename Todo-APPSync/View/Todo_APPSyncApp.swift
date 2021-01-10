//
//  Todo_APPSyncApp.swift
//  Todo-APPSync
//
//  Created by YuHan Hsiao on 2020/12/27.
//

import SwiftUI

@main
struct Todo_APPSyncApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(LoginState.shared)
                .environmentObject(ModelData())
        }
    }
}
