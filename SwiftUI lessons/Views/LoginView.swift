//
//  ContentView.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 29.11.2021.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    // MARK: - Properties
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo = true
    @State private var shouldShowAuthentificationFailureAlert = false
    @State private var isPresentedWebView = false
    
    @Binding var shouldShowMainScreen: Bool
    @Binding var shouldShowVKLoginScreen: Bool
    
    private let buttonMinWidth: CGFloat = 150
    private let buttonMinHeight: CGFloat = 40
    private let maxTextFieldWidth: CGFloat = UIScreen.main.bounds.width * 0.66
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
    ).removeDuplicates()
    
    // MARK: - Body
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Image("Unknown")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 50)
            }
            
            ScrollView {
                VStack {
                    if shouldShowLogo {
                        Text("Weather App")
                            .padding(.top, 50)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    
                    HStack {
                        Text("Login:")
                            .padding(.leading)
                            .foregroundColor(.white)
                        Spacer()
                        TextField("", text: $login)
                            .textFieldStyle(.roundedBorder)
                            .frame(maxWidth: maxTextFieldWidth)
                            .padding(.trailing)
                            .blendMode(.softLight)
                    }
                    .padding(.top, 100)
                    
                    HStack {
                        Text("Password:")
                            .padding(.leading)
                            .foregroundColor(.white)
                        Spacer()
                        SecureField("", text: $password)
                            .textFieldStyle(.roundedBorder)
                            .frame(maxWidth: maxTextFieldWidth)
                            .padding(.trailing)
                            .textContentType(.password)
                            .blendMode(.softLight)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Button {
                            loginButtonTapped()
                        } label: {
                            Text("Login")
                                .foregroundColor(.white)
                        }
                        .frame(minWidth: buttonMinWidth, minHeight: buttonMinHeight)
                        .background(.blue)
                        .cornerRadius(10)
                        .disabled(login.isEmpty || password.isEmpty)
                        
                        Spacer()
                        
                        Button {
                            vkButtonTapped()
                        } label: {
                            Text("VK Login")
                                .foregroundColor(.white)
                        }
                        .frame(minWidth: buttonMinWidth, minHeight: buttonMinHeight)
                        .background(.orange)
                        .cornerRadius(10)
                    }
                    .padding(.top, 200)
                }
            }
            .onReceive(keyboardIsOnPublisher) { isKeyboardOn in
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    self.shouldShowLogo = !isKeyboardOn
                    
                }
            }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            .onAppear {
                UIScrollView.appearance().keyboardDismissMode = .onDrag
            }
            .alert(isPresented: $shouldShowAuthentificationFailureAlert) {
                Alert(title: Text("Ups"),
                      message: Text("Login or password is incorrec, please, try again"),
                      dismissButton: .cancel())
            }
        }
    }
    
    // MARK: - Methods
    private func loginButtonTapped() {
        if login == "1" && password == "2" {
            password = ""
            shouldShowMainScreen = true
        } else {
            password = ""
            shouldShowAuthentificationFailureAlert = true
        }
    }
    
    private func vkButtonTapped() {
        shouldShowVKLoginScreen = true
    }
}
