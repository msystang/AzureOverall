//
//  RecipePersistenceHelper.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation

struct RecipePersistenceHelper {
    // MARK: - Internal Properties
    static let manager = RecipePersistenceHelper()
    
    // MARK: - Internal methods
    func saveRecipe(recipe: Recipe) throws {
        try persistenceManager.save(newObject: recipe)
    }
    
    func getRecipes() throws -> [Recipe] {
        return try persistenceManager.getObjects()
    }
    
    func deletePhotoJournal(with tag: Int) throws {
        try persistenceManager.delete(objectWith: tag)
    }
    
    func editRecipe(at tag: Int, with newObject: Recipe) throws {
        try persistenceManager.edit(objectWith: tag, newObject: newObject)
    }
    
    // MARK: - Private Properties
    private let persistenceManager = PersistenceManager<Recipe>(fileName: "Recipe.plist")
    
    // MARK: - Private Initializers
    private init() {}
}
