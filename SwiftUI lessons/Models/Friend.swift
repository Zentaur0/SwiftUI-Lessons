//
//  Friend.swift.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 11.12.2021.
//

import Foundation
import SwiftUI
import SwiftyJSON

struct Friend: Identifiable, Decodable {
    
    let name: String
    let lastName: String
    let avatarURL: String
    let city: String
    let id: Int
    
    var photos: [Photo] = []

    // MARK: - Init
    
    init(json: SwiftyJSON.JSON) {
        self.id = json["id"].intValue
        self.name = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.city = json["city"]["title"].stringValue
        self.avatarURL = json["photo_100"].stringValue
    }
}
