//
//  FriendsViewModel.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 19.12.2021.
//

import Foundation

final class FriendsViewModel: ObservableObject {
    
    let friendsService: FriendsService
    
    @Published var friends: [Friend] = Storage.shared.friends
    
    init(friendsService: FriendsService) {
        self.friendsService = friendsService
    }
    
    func fetchFriends() {
        friendsService.loadModel(url: URLs.getFriendsURL()) { [weak self] result in
            switch result {
            case .success(let friends):
                DispatchQueue.main.async {
                    Storage.shared.friends = friends
                    self?.friends = friends
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
