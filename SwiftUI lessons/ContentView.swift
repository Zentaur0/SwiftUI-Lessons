//
//  ContentView.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 29.11.2021.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo = true
    
    private let maxTextFieldWidth: CGFloat = 220
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
    ).removeDuplicates()
    
    
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
                    Text("Application")
                        .padding(.top, 50)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack {
                        Text("Login:")
                            .padding(.leading)
                            .foregroundColor(.white)
                        Spacer()
                        TextField("", text: $login)
                            .textFieldStyle(.roundedBorder)
                            .frame(maxWidth: maxTextFieldWidth)
                            .padding(.trailing)
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
                    }
                    
                    Spacer()
                    
                    Button {
                        print("Login Successfull")
                    } label: {
                        Text("Login")
                            .foregroundColor(.white)
                    }
                    .padding(.top, 200)
                    .padding(.bottom, 20)
                    .buttonStyle(.borderedProminent)
                    .disabled(login.isEmpty || password.isEmpty)
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIApplication {
   func endEditing() {
       sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
   }
}
