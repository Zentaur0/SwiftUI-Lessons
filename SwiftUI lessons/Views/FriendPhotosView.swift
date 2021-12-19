//
//  FriendPhotosGallery.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 09.12.2021.
//

import SwiftUI
import ASCollectionView

struct FriendPhotosView: View {
    
    @ObservedObject var viewModel: FriendPhotosViewModel
    
    // MARK: - Body
    var body: some View {
        ASCollectionView(data: viewModel.photos) { photo, context in
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
        .onAppear(perform: viewModel.getFriendPhotosData)
        .navigationTitle(viewModel.friend.name + " " + viewModel.friend.lastName)
    }
}
