//
//  ModelAdapter.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 19.12.2021.
//

import Foundation

protocol NetworkService {
    associatedtype T
    func loadModel(url: URL, completion: @escaping (Result<[T], Error>) -> Void)
}
