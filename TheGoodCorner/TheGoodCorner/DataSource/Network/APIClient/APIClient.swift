//
//  APIClient.swift
//  TheGoodCorner
//
//  Created by Ines SK on 17.09.26.
//

import Foundation

protocol APIClient {
    func request<T: Decodable>(_ endPoint: EndPoint) async throws -> T
}

final class requestAPIClient: APIClient {
    
   private let session: URLSession
    
    init(session: URLSession = .shared){
        self.session = session
    }
    
    /// send the request to a given endPoint and get the desired response decoded
    /// - Parameter endPoint: the API endPoint
    /// - Returns: the decoded response
    func request<T: Decodable>(_ endPoint: EndPoint ) async throws -> T where T : Decodable {
        let url = endPoint.baseURL.appendingPathComponent(endPoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method
        
        do{
            let (data, response) = try await session.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }
            
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                throw APIError.httpError(response.statusCode)
            }
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw APIError.decodingError
            }
        } catch let error as APIError {
            throw error
        }catch{
            throw APIError.networkError(error)
        }
    }
    
}
