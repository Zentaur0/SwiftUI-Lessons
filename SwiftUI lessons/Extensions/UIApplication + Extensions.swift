//
//  UIApplication + Extensions.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 12.12.2021.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
