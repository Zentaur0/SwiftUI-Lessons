//
//  FriendPhotosGallery.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 09.12.2021.
//

import SwiftUI
import ASCollectionView

struct Photo: Identifiable {
    let id: UUID = UUID()
    let image: String
}

struct FriendPhotosView: View {
    
    // MARK: - Properties
    @State private var photos: [Photo]
    
    // MARK: - Init
    init(photos: [Photo]) {
        self.photos = photos
    }
    
    // MARK: - Body
    var body: some View {
        ASCollectionView(data: photos) { photo, context in
            FriendPhotoCell(photo: photo)
        }
        .layout {
            ASCollectionLayoutSection
                .grid(
                    layoutMode: .fixedNumberOfColumns(1),
                    itemSpacing: 15,
                    lineSpacing: 15,
                    itemSize: .estimated(UIScreen.main.bounds.width - 40)
                )
        }
    }
}

struct FriendPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        FriendPhotosView(photos: [Photo(image: "Unknown")])
    }
}
