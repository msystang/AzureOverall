//
//  AppUser.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

struct AppUser {
    // MARK: Properties
    let email: String?
    let uid: String
    let dateCreated: Date?
    
    var fieldsDict: [String: Any] {
        return [
            FieldsDictKey.email.rawValue : self.email ?? ""
        ]
    }
    
    // MARK: Initializations
    // Init to 'encode' to Firestore (creating AppUser object in Firestore from user in FirebaseAuth)
    init(from user: User) {
        self.email = user.email
        self.uid = user.uid
        self.dateCreated = user.metadata.creationDate
    }
    
    // Failing init when 'decoding' from Firestore (getting AppUser object from Firestore)
    init?(from dict: [String: Any], id: String) {
        guard let email = dict[FieldsDictKey.email.rawValue] as? String,
            let dateCreated = (dict[FieldsDictKey.dateCreated.rawValue] as? Timestamp)?.dateValue() else {
                return nil
        }
        
        self.uid = id
        self.email = email
        self.dateCreated = dateCreated
    }
}
