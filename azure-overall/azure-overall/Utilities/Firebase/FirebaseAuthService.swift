//
//  FirebaseAuth.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseAuthService {
    // MARK: - Internal Properties
    static let manager = FirebaseAuthService()
    
    private let auth = Auth.auth()

    var currentUser: User? {
        return auth.currentUser
    }
    
    // MARK: - Instance Methods
    func signUpUser(email: String, password: String, completion: @escaping (Result<User,Error>) -> ()) {
        auth.createUser(withEmail: email, password: password) { (result, error) in
            if let createdUser = result?.user {
                completion(.success(createdUser))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func logInUser(email: String, password: String, completion: @escaping (Result<(), Error>) -> ()) {
        auth.signIn(withEmail: email, password: password) { (result, error) in
            if (result?.user) != nil {
                completion(.success(()))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }

    func signOutUser(completion: @escaping (Result<(),Error>) -> ()) {
        do {
            try auth.signOut()
            completion(.success(()))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    // MARK: - Private Properties and Initializers
    private init () {}
}
