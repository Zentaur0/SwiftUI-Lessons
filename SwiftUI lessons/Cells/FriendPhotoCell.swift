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
    
    @State private var isLikeChanged = false
    @State private var isCommentLeft = false
    
    // MARK: - Init
    init(photo: Photo) {
        self.photo = photo
    }
    
    // MARK: - Body
    var body: some View {
        HStack {
            VStack {
                GeometryReader { geo in
                    KFImage(URL(string: photo.imageURL))
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width, height: geo.size.height)
                }
                
                Spacer()
                
                HStack {
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: isLikeChanged ? "heart.circle.fill" : "heart.circle")
                                .modifier(VKButtonModifier(isButtonChanged: $isLikeChanged))
                        }
                        .scaleEffect(CGSize(width: 2, height: 2))
                        .tint(isLikeChanged ? .red : .black)
                        
                        Text(isLikeChanged ? "1" : "0")
                            .padding(.leading)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text(isCommentLeft ? "1" : "0")
                            .padding(.trailing)
                        
                        Button {
                            
                        } label: {
                            Image(systemName: isCommentLeft ? "message.circle.fill" : "message.circle")
                                .modifier(VKButtonModifier(isButtonChanged: $isCommentLeft))
                        }
                        .scaleEffect(CGSize(width: 2, height: 2))
                        .tint(.black)
                    }
                    
                }
                .padding(.all)
            }
        }
        .border(.black)
        .cornerRadius(2)
    }
}
