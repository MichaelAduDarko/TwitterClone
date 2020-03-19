//
//  FeedController.swift
//  TwitterClone
//
//  Created by MICHAEL ADU DARKO on 3/13/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit

class FeedController: UIViewController {
       //MARK:- Properties
    var user: User? {
        didSet{
            print("DEBUG: Did set user in feed controller")
        }
    }
    
     //MARK:- Lifecycle

     override func viewDidLoad() {
         super.viewDidLoad()
        configureUI()
        
     }
     
    //MARK:- Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        
        
        let profileImageView = UIImageView()
        profileImageView.backgroundColor = .twitterBlue
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 32 / 2
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
        
        
        
    }
}
