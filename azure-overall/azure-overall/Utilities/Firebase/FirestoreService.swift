//
//  FirestoreService.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

fileprivate enum FireStoreCollections: String {
    case users
}

class FirestoreService {
    
    //MARK: - Static Properties
    static let manager = FirestoreService()
    
    private let db = Firestore.firestore()
    
    //MARK: - Instance Methods
    //Users
    func createUser(user: AppUser, completion: @escaping (Result<(), Error>) -> ()) {
        var fields = user.fieldsDict
        fields["dateCreated"] = Date()
        db.collection(FireStoreCollections.users.rawValue).document(user.uid).setData(fields) { (error) in
            if let error = error {
                completion(.failure(error))
                print(error)
            }
            completion(.success(()))
        }
    }
    
    //MARK: - Private Properties and Initializers
    private init () {}
}
