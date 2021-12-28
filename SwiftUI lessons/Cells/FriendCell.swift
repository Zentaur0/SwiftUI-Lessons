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
    private let imageAnimation = Animation.easeIn(duration: 1.5)
    @State private var isImageDamping = false
    @State private var isInitialPoint = false
    
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
                .scaleEffect(isImageDamping ? 2 : 1)
                .scaleEffect(isInitialPoint ? 0.5 : 1)
                .animation(.interpolatingSpring(stiffness: 200, damping: 3),
                           value: isImageDamping)
                .onTapGesture {
                    isImageDamping.toggle()
                    isInitialPoint.toggle()
                }
            
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
