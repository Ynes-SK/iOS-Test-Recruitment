//
//  ItemEndPoint.swift
//  TheGoodCorner
//
//  Created by Ines SK on 17.09.26.
//

import Foundation

enum ItemEndPoint: EndPoint {
    
    case listings
    case categories
    
    var baseURL: URL{
        URL(string: "http://localhost:8080")!
    }
    
    var path: String {
        switch self{
        case .listings:
            return "/listings"
        case .categories:
            return "/categories"
        }
    }
    
    var method: String{
        "GET"
    }
}
