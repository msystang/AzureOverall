//
//  RecipeNetworkHelper.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/27/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation

class RecipeNetworkHelper {
    
    // MARK: - Singleton
    static let manager = RecipeNetworkHelper()
    
    // MARK: - Instance Methods
    static func getUrlStr(from searchString: String, searchCount: Int) -> String {
        return "https://api.spoonacular.com/recipes/search?query=\(searchString)&number=\(searchCount)&apiKey=\(Secrets.spoonacularKey)"
    }
    
    func getRecipes(from urlStr: String, completion: @escaping (Result<[Recipe],NetworkingError>) -> ()) {
        
        guard let url = URL(string: urlStr) else {
            completion(.failure(NetworkingError.badURL))
            return
        }
        
        NetworkManager.manager.getDataFromDataTask(from: url, with: .get) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(let data):
                    do {
                        let recipes = try Recipe.decodeFromData(from: data)
                        completion(.success(recipes))
                    } catch {
                        completion(.failure(.couldNotParseJSON(rawError: error)))
                    }
                }
            }
        }
    }
    
    // MARK: - Private Properties and Initializers
    private init() {}
}
