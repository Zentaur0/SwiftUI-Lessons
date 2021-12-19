//
//  FriendPhotoCell.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 12.12.2021.
//

import SwiftUI
import Kingfisher

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
                KFImage(URL(string: photo.imageURL))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}
