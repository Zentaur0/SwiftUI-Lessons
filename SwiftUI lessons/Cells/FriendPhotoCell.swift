//
//  FriendPhotoCell.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 12.12.2021.
//

import SwiftUI

struct FriendPhotoCell: View {
    
    // MARK: - Properties
    private let photo: Photo
    
    // MARK: - Init
    init(photo: Photo) {
        self.photo = photo
    }
    
    // MARK: - Body
    var body: some View {
        HStack {
            GeometryReader { _ in
                Image(photo.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}
