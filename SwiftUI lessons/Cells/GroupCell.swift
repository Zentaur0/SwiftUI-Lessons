//
//  SecondCell.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 06.12.2021.
//

import SwiftUI

struct GroupCell: View {
    
    @State var groupName: String = ""
    @State var imageName: String = ""
    
    private let imageMargin: CGFloat = 50
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: imageMargin, height: imageMargin, alignment: .leading)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(groupName)
                    .fontWeight(.bold)
            }
        }
        .modifier(CellModifier())
    }
    
    func configure(name: String, image: String) -> Self {
        GroupCell(groupName: name, imageName: image)
    }
}

struct GroupCell_Previews: PreviewProvider {
    static var previews: some View {
        GroupCell().configure(name: "Some Group", image: "Unknown")
    }
}
