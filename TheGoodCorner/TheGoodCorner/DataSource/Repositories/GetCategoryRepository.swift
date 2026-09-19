//
//  GetCategoryRepository.swift
//  TheGoodCorner
//
//  Created by Ines SK on 18.09.26.
//

import Foundation
final class GetCategoryRepository: GetCategoryProtocol{
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient = requestAPIClient()) {
        self.apiClient = apiClient
    }
    
    func getCategory() async throws -> [ItemCategory] {
        return try await apiClient.request(ItemEndPoint.categories)
    }

}
