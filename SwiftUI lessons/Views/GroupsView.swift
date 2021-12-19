//
//  GroupsView.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 11.12.2021.
//
//

import SwiftUI

struct GroupsView: View {
    
    // MARK: - Properties
    private let groups: [Group] = []
    
    @ObservedObject var groupsViewModel: GroupsViewModel
    
    init(viewModel: GroupsViewModel) {
        self.groupsViewModel = viewModel
    }
    
    // MARK: - Body
    var body: some View {
        List(groupsViewModel.groups) { group in
            NavigationLink {
                
            } label: {
                GroupCell(group: group)
            }
        }.onAppear(perform: groupsViewModel.fetchGroups)
    }
}
