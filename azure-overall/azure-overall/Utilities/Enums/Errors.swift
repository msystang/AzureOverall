//
//  AppError.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/27/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation

// MARK: - AppError
enum AppError: Error {
    
}

// MARK: - NetworkingError
enum NetworkingError: Error {
    // NetworkingManager Errors
    case noDataReceived
    case badStatusCode
    case noInternetConnection
    case other(rawError: Error)
    
    // RecipeNetworkHelper Errors
    case badURL
    case couldNotParseJSON(rawError: Error)
}

// MARK: - PersistenceError
enum PersistenceError: Error {
    case noDataFromUrlPath
    case couldNotDecodeFromUrlPath
    
    case noRecipeWithGivenIdInCart
    case multipleEntriesWithSameIdInCart
    case couldNotGetTagToEditRecipe
    case other(rawError: Error)
}
