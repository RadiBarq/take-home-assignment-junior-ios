//
//  NetworkingManager.swift
//  EasyShopper
//
//  Created by Harri on 6/26/20.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation

/// API Error
enum APIError: Error {
    case responseProblem
    case decondingProblem
    case encodingProblem
}


/// Networking Manager
class NetworkingManager {
    
    /// Products URL
    static let productsURL = URL(string: "https://run.mocky.io/v3/4e23865c-b464-4259-83a3-061aaee400ba")
    
    /**
     Get products
     */
    static func getProducts(completion: @escaping (Result<[Product], APIError>) -> Void) {
        
        guard let url = productsURL else { return }
        
        // Setup url request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        // Get products
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response,_ in
            
            // Check response status and if data is exists
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
                completion(.failure(.responseProblem))
                return
            }
            
            do {
                
                // Setup json decoder
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                // Decocde data to dictionary of products
                let result = try decoder.decode([String: Product].self, from: data)
                
                // Products
                let products = Array(result.values)
                
                // Return products
                completion(.success(products))
                
            } catch {
                
                // Return decoding problem
                completion(.failure(.decondingProblem))
            }
        }
        
        dataTask.resume()
    }
}


