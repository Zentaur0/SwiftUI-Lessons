//
//  FriendsView.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 11.12.2021.
//

import SwiftUI

struct FriendsView: View {
    
    // MARK: - Properties
    private var friends: [Friend] = []
    
    @ObservedObject var friendsViewModel: FriendsViewModel
    
    init(viewModel: FriendsViewModel) {
        self.friendsViewModel = viewModel
    }
    
    // MARK: - Body
    var body: some View {
        List(friendsViewModel.friends) { friend in
            NavigationLink {
                FriendPhotosView(
                    viewModel: FriendPhotosViewModel(
                        friend: friend,
                        friendsService: friendsViewModel.friendsService)
                )
            } label: {
                FriendCell(friend: friend)
            }
        }.onAppear(perform: friendsViewModel.fetchFriends)
    }
}

class Storage {

    static let shared = Storage()
    
    private init() {}
    
    var friends: [Friend] = []
    var groups: [Group] = []
}
