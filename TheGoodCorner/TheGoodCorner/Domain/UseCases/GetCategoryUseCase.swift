//
//  GetCategoryUseCase.swift
//  TheGoodCorner
//
//  Created by Ines SK on 18.09.26.
//

import Foundation
protocol GetCategoryUseCaseProtocol{
    func excuteCategory() async throws -> [ItemCategory]
}
final class GetCategoryUseCase: GetCategoryUseCaseProtocol{
    
    private let repository: GetCategoryProtocol
    init(repository: GetCategoryProtocol = GetCategoryRepository()) {
        self.repository = repository
    }
    func excuteCategory() async throws -> [ItemCategory] {
        try await repository.getCategory()
    }
}
