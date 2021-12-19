//
//  SecondCell.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 06.12.2021.
//

import SwiftUI
import Kingfisher

struct GroupCell: View {
    
    // MARK: - Properties
    private let imageMargin: CGFloat = 50
    private let group: Group
    
    // MARK: - Init
    init(group: Group) {
        self.group = group
    }
    
    // MARK: - Body
    var body: some View {
        HStack {
            KFImage(URL(string: group.avatarURL))
                .resizable()
                .frame(width: imageMargin, height: imageMargin, alignment: .leading)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(group.name)
                    .fontWeight(.bold)
            }
        }
        .modifier(CellModifier())
    }
}

//struct GroupCell_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupCell()
//    }
//}
