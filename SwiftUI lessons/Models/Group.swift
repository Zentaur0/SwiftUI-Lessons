//
//  Group.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 11.12.2021.
//

import Foundation
import SwiftyJSON

class Group: Identifiable, Decodable {
    
    let id: Int
    let name: String
    let avatarURL: String
    
    init(json: SwiftyJSON.JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.avatarURL = json["photo_100"].stringValue
    }
}
