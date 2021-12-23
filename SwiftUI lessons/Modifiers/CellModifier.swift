//
//  CellModifier.swift.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 07.12.2021.
//

import SwiftUI

struct CellModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .frame(maxHeight: 70)
    }
}
