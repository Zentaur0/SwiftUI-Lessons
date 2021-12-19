//
//  GroupService.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 19.12.2021.
//

import Foundation
import SwiftyJSON

final class GroupService: NetworkService {
    func loadModel(url: URL, completion: @escaping (Result<[Group], Error>) -> Void) {
        loadGroups(url: url, completion: completion)
    }
    
    private func loadGroups(url: URL, completion: @escaping (Result<[Group], Error>) -> Void) {
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, response, error in
            do {
                guard let data = data else { return }
                
                let json = try JSON(data: data)
                let groupsJSON = json["response"]["items"].arrayValue
                let groups = groupsJSON.map { Group(json: $0) }
                
                completion(.success(groups))
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
