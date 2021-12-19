//
//  FriendsView.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 11.12.2021.
//

import SwiftUI

struct FriendsView: View {
    
    // MARK: - Properties
    private let friends = [
        Friend(name: "Mark", lastName: "Ruffalo", age: 45, photos: [
            Photo(image: "Unknown-3"),
            Photo(image: "Unknown-1"),
            Photo(image: "Unknown-4"),
            Photo(image: "Unknown")
        ]),
        Friend(name: "James", lastName: "Kigelbaun", age: 33, photos: [
            Photo(image: "Unknown-2"),
            Photo(image: "Unknown-1"),
            Photo(image: "Unknown-4")
        ]),
        Friend(name: "Rinata", lastName: "Letvinova", age: 37, photos: [
            Photo(image: "Unknown-4"),
            Photo(image: "Unknown-1")
        ]),
        Friend(name: "Micheil", lastName: "Romanov", age: 24, photos: [
            Photo(image: "Unknown-3"),
            Photo(image: "Unknown-1"),
            Photo(image: "Unknown")
        ]),
        Friend(name: "Oksana", lastName: "Projnikova", age: 28, photos: [
            Photo(image: "Unknown-2"),
            Photo(image: "Unknown-3")
        ])
    ]
    
    // MARK: - Body
    var body: some View {
        List(friends) { friend in
            NavigationLink {
                FriendPhotosView(photos: friend.photos)
            } label: {
                FriendCell(friend: friend)
            }
        }
    }
}
