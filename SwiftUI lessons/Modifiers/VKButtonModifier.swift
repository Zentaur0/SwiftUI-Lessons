//
//  VKButtonModifier.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 28.12.2021.
//

import SwiftUI

struct VKButtonModifier: ViewModifier {
    
    @Binding var isButtonChanged: Bool
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(isButtonChanged ? 360 : 0))
            .scaleEffect(isButtonChanged ? 1.1 : 1)
            .animation(.interpolatingSpring(stiffness: 100, damping: 10), value: isButtonChanged)
            .onTapGesture {
                isButtonChanged.toggle()
            }
    }
}
