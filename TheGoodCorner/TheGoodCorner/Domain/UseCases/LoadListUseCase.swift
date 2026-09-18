//
//  LoadListUseCase.swift
//  TheGoodCorner
//
//  Created by Ines SK on 18.09.26.
//

import Foundation
protocol LoadListUseCaseProtocol{
    func excuteLoadList() async throws -> ListingModel
}

final class LoadListUseCase: LoadListUseCaseProtocol{
    
    private let repository: LoadListProtocol
    init(repository: LoadListProtocol = LoadListRepository()) {
        self.repository = repository
    }
    func excuteLoadList() async throws -> ListingModel {
        try await repository.LoadList()
    }
}
