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
    
    func deleteRecipe(with tag: Int) throws {
        try persistenceManager.delete(objectWith: tag)
    }
    
    func editRecipe(at tag: Int, with newObject: Recipe) throws {
        try persistenceManager.edit(objectWith: tag, newObject: newObject)
    }
    
    func isInCart(recipeID: Int) throws -> Bool {
        var recipes = [Recipe]()
        
        do {
            recipes = try getRecipes()
        } catch {
            throw PersistenceError.other(rawError: error)
        }
        
        let recipeIDs = recipes.map { $0.id }
        
        return recipeIDs.contains(recipeID)
    }
    
    func getRecipe(with id: Int) throws -> Recipe? {
        var recipes = [Recipe]()
        
        do {
            recipes = try getRecipes()
        } catch {
            throw PersistenceError.other(rawError: error)
        }
        
        let recipesWithId = recipes.filter { $0.id == id }
        
        guard let firstRecipe = recipesWithId.first else {
            throw PersistenceError.noRecipeWithGivenIdInCart
        }
        
        guard recipesWithId.count == 1 else {
            throw PersistenceError.multipleEntriesWithSameIdInCart
        }
        
        return firstRecipe
    }
    
    // MARK: - Private Properties
    private let persistenceManager = PersistenceManager<Recipe>(fileName: "Recipe.plist")
    
    // MARK: - Private Initializers
    private init() {}
}
