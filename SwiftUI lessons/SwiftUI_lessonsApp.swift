//
//  SwiftUI_lessonsApp.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 29.11.2021.
//

import SwiftUI

@main
struct SwiftUI_lessonsApp: App {
    
    let isAuthorized = UserDefaults.standard.bool(forKey: "isAuthorized")
    
    var body: some Scene {
        WindowGroup {
            if let isAuthorized = isAuthorized, isAuthorized {
                NavigationView {
                    MainScreen()
                }
            } else {
                LoginScreen()
            }
        }
    }
}
