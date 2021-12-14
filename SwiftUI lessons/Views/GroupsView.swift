//
//  GroupsView.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 11.12.2021.
//

import SwiftUI

struct GroupsView: View {
    
    // MARK: - Properties
    private let groups = [
        Group(name: "Geekbrainers"),
        Group(name: "Swifters"),
        Group(name: "Lollypopsers")
    ]
    
    // MARK: - Body
    var body: some View {
        List(groups) { group in
            NavigationLink {
                
            } label: {
                GroupCell(group: group)
            }
        }
    }
}
