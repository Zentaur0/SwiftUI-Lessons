//
//  FirstCell.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 06.12.2021.
//

import SwiftUI

struct FriendCell: View {
    
    @State var userName: String = ""
    @State var lastName: String = ""
    @State var imageName: String = ""
    @State var age: Int = 0
    
    private let imageMargin: CGFloat = 50
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: imageMargin, height: imageMargin, alignment: .leading)
                .cornerRadius(25)
                .shadow(color: .gray, radius: 2, x: 2, y: 2)
            
            VStack(alignment: .leading) {
                Text(userName + " " + lastName)
                Spacer()
                Text("\(age)")
                    .foregroundColor(.gray)
            }
        }
        .modifier(CellModifier())
        
    }
    
    func configure(name: String, lastName: String, imageName: String, age: Int) -> Self {
        FriendCell(userName: name, lastName: lastName, age: age)
    }
}

struct FriendCell_Previews: PreviewProvider {
    static var previews: some View {
        FriendCell()
            .configure(
                name: "Viktor",
                lastName: "Krum",
                imageName: "Unknown",
                age: 24
            )
    }
}
