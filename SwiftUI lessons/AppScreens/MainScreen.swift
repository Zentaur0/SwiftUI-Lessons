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
    
    private let friendsService = FriendsService()
    private let groupsService = GroupService()
    
    // MARK: - Body
    var body: some View {
        TabView(selection: $selection) {
            FriendsView(viewModel: FriendsViewModel(friendsService: friendsService))
                .tabItem {
                    Label("Friends", systemImage: "list.dash")
                }.tag(0)
            
            GroupsView(viewModel: GroupsViewModel(groupsService: groupsService))
                .tabItem {
                    Label("Groups", systemImage: "circle.grid.cross")
                }.tag(1)
            
            NewsView()
                .tabItem {
                    Label("News", systemImage: "square.text.square")
                }.tag(2)
            
        }
        .navigationTitle(setupNavigationTitle(selection))
    }
    
    private func setupNavigationTitle(_ tab: Int) -> String {
        switch tab {
        case 0: return "Friends"
        case 1: return "Groups"
        default: return "News"
        }
    }
}
