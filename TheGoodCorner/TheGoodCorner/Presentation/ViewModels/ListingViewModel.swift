//
//  ListingViewModel.swift
//  TheGoodCorner
//
//  Created by Ines SK on 18.09.26.
//

import Foundation

@MainActor
class ListingViewModel: ObservableObject{
    @Published var listingModel: ListingModel = ListingModel(total: 0, page: 0, limit: 0, has_more: false, items: [])
    private let useCase: LoadListUseCaseProtocol
    
    init(useCase: LoadListUseCaseProtocol = LoadListUseCase()) {
        self.useCase = useCase
    }
    
    func loadList() async {
        do{
            listingModel = try await useCase.excuteLoadList()
        }catch{
            print("error")
        }
    }
}
