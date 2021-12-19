//
//  AppView.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 11.12.2021.
//

import SwiftUI

struct LoginScreen: View {
    
    // MARK: - Properties
    @State private var shouldShowMainScreen = false
    @State private var shouldShowVKScreen = false
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            HStack {
                LoginView(
                    shouldShowMainScreen: $shouldShowMainScreen,
                    shouldShowVKLoginScreen: $shouldShowVKScreen
                )
                
                NavigationLink(isActive: $shouldShowVKScreen) {
                    VKLoginWebView()
                } label: {
                    EmptyView()
                }
                
                NavigationLink(isActive: $shouldShowMainScreen) {
                    MainScreen()
                } label: {
                    EmptyView()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
            .previewDevice(PreviewDevice(rawValue: "IPhone 12"))
    }
}
