//
//  NetworkManager.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/27/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation

class NetworkManager {
    
    // MARK: - Singleton
    static let manager = NetworkManager()
    
    // MARK: - Instance Methods
    func getDataFromDataTask(from url: URL, with hTTPMethod: HTTPMethod, and hTTPBody: Data? = nil, completion: @escaping (Result<Data,AppError>) -> ()) {
        
        // Create an instance of URL request with given url
        var urlRequest = URLRequest(url: url)
        // Set the kind of request (get vs. post)
        urlRequest.httpMethod = hTTPMethod.rawValue
        // Set the body (message) for the request as Data, if any
        urlRequest.httpBody = hTTPBody
        // Set the request headers
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlSession.dataTask(with: urlRequest) { (data, response, error) in
            // Dispatches data task asynchronously on the main thread
            DispatchQueue.main.async {
                
                // guard that we received data
                guard let data = data else {
                    completion(.failure(.networkingNoDataReceived))
                    return
                }
                
                // guard that we get a response within 200 success codes by using static func ~= to indicate bool for stated closed range
                guard let response = response as? HTTPURLResponse, (200...299) ~= response.statusCode else {
                    completion(.failure(.networkingBadStatusCode))
                    return
                }
                
                // handle any errors
                if let error = error {
                    let error = error as NSError
                    if error.domain == NSURLErrorDomain && error.code == NSURLErrorNotConnectedToInternet {
                        completion(.failure(.networkingNoInternetConnection))
                        return
                    } else {
                        completion(.failure(.other(rawError: error)))
                        return
                    }
                }
                
                completion(.success(data))
            }
        }.resume()
    }
    
    // MARK: - Private Properties and Initializers
    
    // creates an instance of URLSession, which allows data to be uploaded/downloaded to/from an API endpoint
    private let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    
    private init() {}
}
