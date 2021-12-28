//
//  GroupsViewModel.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 19.12.2021.
//

import Foundation

final class GroupsViewModel: ObservableObject {
    
    private let groupsService: GroupService
    
    @Published var groups: [Group] = Storage.shared.groups
    
    init(groupsService: GroupService) {
        self.groupsService = groupsService
    }
    
    func fetchGroups() {
        groupsService.loadModel(url: URLs.getGroupsURL()) { [weak self] result in
            switch result {
            case .success(let groups):
                DispatchQueue.main.async {
                    Storage.shared.groups = groups
                    self?.groups = groups
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
