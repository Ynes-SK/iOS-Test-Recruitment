//
//  ListingModel.swift
//  TheGoodCorner
//
//  Created by Ines SK on 18.09.26.
//

struct ListingModel: Decodable, Hashable{
    let total: Int
    let page: Int
    let limit: Int
    let has_more: Bool
    let items: [ListingDetails]
}

struct ListingDetails: Decodable, Hashable{
    let id: Int
    let category_id: Int
    let title: String
    let description: String
    let price: Double
    let creation_date: String
    let is_urgent: Bool
    let images_url: ImageString?
}

struct ImageString: Decodable, Hashable{
    let small: String?
    let thumb: String?
}
struct ItemCategory: Decodable, Hashable{
    let id: Int
    let name: String
}

