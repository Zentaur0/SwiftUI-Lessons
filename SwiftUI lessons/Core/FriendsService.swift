//
//  FriendPhotoService.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 12.12.2021.
//

import Foundation
import SwiftyJSON

final class FriendsService: NetworkService {
    func loadModel(url: URL, completion: @escaping (Result<[Friend], Error>) -> Void) {
        loadFriends(url: url, completion: completion)
    }
    
    func loadFreindsPhotos(friend: Friend, completion: @escaping (Result<[Photo], Error>) -> Void) {
        loadPhotos(friend: friend, completion: completion)
    }
    
    private func loadFriends(url: URL, completion: @escaping (Result<[Friend], Error>) -> Void) {
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, response, error in
            do {
                guard let data = data else { return }
                
                let json = try JSON(data: data)
                let friendsJSON = json["response"]["items"].arrayValue
                let friends = friendsJSON.map { Friend(json: $0) }
                
                completion(.success(friends))
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    private func loadPhotos(friend: Friend, completion: @escaping (Result<[Photo], Error>) -> Void) {
        let url = "https://api.vk.com/method/photos.getAll?access_token=\(Session.shared.token)&owner_id=\(friend.id)&extended=1&v=5.131"
        
        guard let url = URL(string: url) else { return }

        let session = URLSession.shared
        
        session.dataTask(with: url) { data, response, error in
            do {
                guard let data = data else { return }
                let json = try JSON(data: data)
                let photoJSON = json["response"]["items"].arrayValue
                let photos = photoJSON.map { Photo(json: $0) }
                
                completion(.success(photos))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
