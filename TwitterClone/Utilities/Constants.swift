//
//  Constants.swift
//  TwitterClone
//
//  Created by MICHAEL ADU DARKO on 3/14/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit
import Firebase

let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")


let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")

let REF_TWEETS  = DB_REF.child("tweets")

