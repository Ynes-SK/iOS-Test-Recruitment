//
//  LoadListRepository.swift
//  TheGoodCorner
//
//  Created by Ines SK on 18.09.26.
//

import Foundation

final class LoadListRepository: LoadListProtocol{
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient = requestAPIClient()) {
        self.apiClient = apiClient
    }
    
    func LoadList() async throws -> ListingModel {
        return try await apiClient.request(ItemEndPoint.listings)
    }

}
