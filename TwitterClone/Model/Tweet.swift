//
//  Tweet.swift
//  TwitterClone
//
//  Created by MICHAEL ADU DARKO on 3/22/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit
import Firebase

struct Tweet {
    let caption: String
    let tweetID: String
    let uid: String
    let likes: Int
    var timeStamp: Date!
    let retweetCount: Int
    
    init(tweetID: String, dictionary: [String: Any]){
        self.tweetID = tweetID
        
        self.caption = dictionary["caption"] as? String ?? ""
        self.uid = dictionary["caption"] as? String ?? ""
        self.likes = dictionary["caption"] as? Int ?? 0
        self.retweetCount = dictionary["caption"] as? Int ?? 0
        
        if let timestamp = dictionary["timestamp"] as? Double {
            self.timeStamp = Date(timeIntervalSince1970: timestamp)
        }
       
    }
}
