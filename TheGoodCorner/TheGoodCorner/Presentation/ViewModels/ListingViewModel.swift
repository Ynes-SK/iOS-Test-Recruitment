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
    @Published var categories: [ItemCategory] = []
    private let listingUseCase: LoadListUseCaseProtocol
    private let categoryUseCase: GetCategoryUseCaseProtocol
    
    init(listingUseCase: LoadListUseCaseProtocol = LoadListUseCase(), categoryUseCase: GetCategoryUseCaseProtocol = GetCategoryUseCase()) {
        self.listingUseCase = listingUseCase
        self.categoryUseCase = categoryUseCase
    }
    
    func loadList() async {
        do{
            listingModel = try await listingUseCase.excuteLoadList()
        }catch{
            print("error")
        }
    }
    
    func getCategory() async {
        do{
            categories = try await categoryUseCase.excuteCategory()
        }catch{
            print("error")
        }
    }
    /// getCategoryNameById
    /// - Parameter id: listing id
    /// - Returns: category Name
    func getCategoryNameById(for id: Int) -> String{
        categories.first(where: {id == $0.id})?.name ?? ""
    }
}
