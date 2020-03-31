//
//  Recipe.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/27/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation

// MARK: - Recipe
struct Recipe: Codable {
    // MARK: Properties
    private let image: String
    let id: Int
    let title: String
    let readyInMinutes: Int
    let servings: Int
        
    var quantity: Int?
    var imageUrl: String {
        return "https://spoonacular.com/recipeImages/\(image)"
    }
    
    // MARK: Internal Methods
    static func decodeFromData(from jsonData: Data) throws -> [Recipe] {
        let decodeResponse = try JSONDecoder().decode(RecipeWrapper.self, from: jsonData)
        return decodeResponse.results
    }
    
}

// MARK: - RecipeWrapper
struct RecipeWrapper: Codable {
    let results: [Recipe]
}
