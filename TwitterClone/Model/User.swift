//
//  User.swift
//  TwitterClone
//
//  Created by MICHAEL ADU DARKO on 3/18/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit
import Firebase

struct User {
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: URL?
    let uid: String
    
    init(uid: String, dictionary: [String: AnyObject]){
        self.uid = uid
        
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
       
        if let profileImageUrlString = dictionary["profileImageUrl"] as? String {
            guard let url = URL(string: profileImageUrlString ) else {return}
            self.profileImageUrl = url
        }
        
        
    }
}
