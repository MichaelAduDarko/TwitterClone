//
//  FeedController.swift
//  TwitterClone
//
//  Created by MICHAEL ADU DARKO on 3/13/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit
import SDWebImage

class FeedController: UIViewController {
       //MARK:- Properties
    var user: User? {
        didSet{
            configureLeftBarButtoon()
        }
    }
    
     //MARK:- Lifecycle

     override func viewDidLoad() {
         super.viewDidLoad()
        configureUI()
        fetchTweet()
        
     }
    
    //MARK:- API
    func fetchTweet(){
        TweetService.shared.fetchTweets { tweets in
            print("DEBUG: Tweets are \(tweets)")
        }
    }
     
    //MARK:- Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        imageView.setDimensions(width: 44, height: 44)
        navigationItem.titleView = imageView
        
        
        
    }
    
    func configureLeftBarButtoon(){
        guard let user = user else {return}
        
        let profileImageView = UIImageView()
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 32 / 2
        profileImageView.layer.masksToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        
       
        profileImageView.sd_setImage(with: user.profileImageUrl, completed: nil)
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }
}
