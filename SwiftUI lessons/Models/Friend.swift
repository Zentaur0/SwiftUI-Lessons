//
//  Friend.swift.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 11.12.2021.
//

import Foundation
import UIKit

struct Friend: Identifiable {
    let id: UUID = UUID()
    let name: String
    let lastName: String
    var imageName: String = "Unknown"
    let age: Int
    var photos: [Photo] = []
}
