//
//  Group.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 11.12.2021.
//

import Foundation

struct Group: Identifiable {
    let id: UUID = UUID()
    let name: String
    var imageName: String = "Unknown"
}
