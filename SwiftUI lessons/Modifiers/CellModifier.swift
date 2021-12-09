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
            .padding([.leading, .trailing], 10)
            .padding([.top, .bottom], 10)
            .border(.gray, width: 1)
            .frame(maxHeight: 70)
    }
}