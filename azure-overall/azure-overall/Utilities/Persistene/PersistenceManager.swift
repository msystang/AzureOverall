//
//  PersistenceManager.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation

struct PersistenceManager<T: Codable> {
    // MARK: - Instance Methods
    
    // Get and array of objects by decoding from the urlPath in the FileManager's singleton
    func getObjects() throws -> [T] {
        guard let data = FileManager.default.contents(atPath: url.path) else {
            print(PersistenceError.noDataFromUrlPath.localizedDescription)
            return []
        }
        return try PropertyListDecoder().decode([T].self, from: data)
    }
    
    func save(newObject: T) throws {
        var elements = try getObjects()
        elements.append(newObject)
        let serializedData = try PropertyListEncoder().encode(elements)
        try serializedData.write(to: url, options: Data.WritingOptions.atomic)
    }
    
    func delete(objectWith tag: Int) throws {
        var elements = try getObjects()
        elements.remove(at: tag)
        let serializedData = try PropertyListEncoder().encode(elements)
        try serializedData.write(to: url, options: Data.WritingOptions.atomic)
    }
    
    func edit(objectWith tag: Int, newObject: T) throws {
        var elements = try getObjects()
        elements[tag] = newObject
        let serializedData = try PropertyListEncoder().encode(elements)
        try serializedData.write(to: url, options: Data.WritingOptions.atomic)
    }
    
    func deleteAllObjects() throws {
        let elements = [T]()
        let serializedData = try PropertyListEncoder().encode(elements)
        try serializedData.write(to: url, options: Data.WritingOptions.atomic)
    }
    
    // MARK: - Initializers
    init(fileName: String) {
        self.fileName = fileName
    }
    
    // MARK: - Private Properties
    private let fileName: String
    private let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    private var url: URL {
        return filePathFromDocumentsDirectory(name: fileName)
    }
    
    // MARK: - Private Methods
    private func filePathFromDocumentsDirectory(name: String) -> URL {
        return documentsDirectory.appendingPathComponent(name)
    }
}
