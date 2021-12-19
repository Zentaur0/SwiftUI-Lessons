//
//  FirstCell.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 06.12.2021.
//

import SwiftUI
import Kingfisher

struct FriendCell: View {
    
    // MARK: - Properties
    private let imageMargin: CGFloat = 50
    private let friend: Friend
    
    // MARK: - Init
    init(friend: Friend) {
        self.friend = friend
    }
    
    // MARK: - Body
    var body: some View {
        HStack {
            KFImage(URL(string: friend.avatarURL))
                .resizable()
                .frame(width: imageMargin, height: imageMargin, alignment: .leading)
                .cornerRadius(25)
                .shadow(color: .gray, radius: 2, x: 2, y: 2)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(friend.name + " " + friend.lastName)
                Spacer()
                Text(friend.city)
                    .foregroundColor(.gray)
            }
        }
        .modifier(CellModifier())
    }
}
