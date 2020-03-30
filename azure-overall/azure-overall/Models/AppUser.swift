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
    let email: String?
    let uid: String
    let dateCreated: Date?
    
    //Instatiating to 'encode' to Firestore
    init(from user: User) {
        self.email = user.email
        self.uid = user.uid
        self.dateCreated = user.metadata.creationDate
    }
    
    //Instatiating when 'decoding' from Firestore
    init?(from dict: [String: Any], id: String) {
        guard let email = dict["email"] as? String,
            let dateCreated = (dict["dateCreated"] as? Timestamp)?.dateValue() else { return nil }
        
        self.uid = id
        self.email = email
        self.dateCreated = dateCreated
    }
    
    var fieldsDict: [String: Any] {
        return [
            "email": self.email ?? ""
        ]
    }
}
