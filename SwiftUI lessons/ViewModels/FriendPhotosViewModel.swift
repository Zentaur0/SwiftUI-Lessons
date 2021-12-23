//
//  FriendPhotosViewModel.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 12.12.2021.
//

import Foundation
import Combine

class FriendPhotosViewModel: ObservableObject {
    
    // MARK: - Properties
    let friend: Friend
    private let friendsService: FriendsService
    
    @Published var photos: [Photo] = []
    
    // MARK: - Init
    init(friend: Friend, friendsService: FriendsService) {
        self.friend = friend
        self.friendsService = friendsService
    }
    
    func getFriendPhotosData() {
        friendsService.loadFreindsPhotos(friend: friend) { [weak self] result in
            switch result {
            case .success(let photos):
                DispatchQueue.main.async {
                    self?.photos = photos
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
