//
//  MainScreen.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 09.12.2021.
//

import SwiftUI

struct MainScreen: View {
    
    // MARK: - Properties
    @State private var selection: Int = 0
    
    // MARK: - Body
    var body: some View {
        TabView(selection: $selection) {
            FriendsView()
                .tabItem {
                    Label("Friends", systemImage: "list.dash")
                }.tag(0)
            
            GroupsView()
                .tabItem {
                    Label("Groups", systemImage: "circle.grid.cross")
                }.tag(1)
        }.navigationTitle(selection == 0 ? "Friends" : "Groups")
    }
}
