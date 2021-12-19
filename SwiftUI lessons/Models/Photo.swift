//
//  Photo.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 12.12.2021.
//

import Foundation
import SwiftyJSON

struct Photo: Identifiable, Decodable {
    let id: Int
    let ownerID: Int
    let imageURL: String
    let likes: Int
    let width: Int
    let height: Int

    // MARK: - Init
    init(json: SwiftyJSON.JSON) {
        self.ownerID = json["owner_id"].intValue
        self.id = json["id"].intValue
        let size = json["sizes"].arrayValue.last
        self.imageURL = size?["url"].stringValue ?? ""
        self.width = size?["width"].intValue ?? 0
        self.height = size?["height"].intValue ?? 0
        self.likes = json["likes"]["count"].intValue
    }
}
