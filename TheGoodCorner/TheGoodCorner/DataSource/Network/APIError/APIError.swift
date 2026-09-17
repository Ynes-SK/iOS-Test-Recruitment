//
//  APIError.swift
//  TheGoodCorner
//
//  Created by Ines SK on 17.09.26.
//

enum APIError: Error{
    case invalidURL
    case invalidResponse
    case httpError(Int)
    case decodingError
    case networkError(Error)
}
