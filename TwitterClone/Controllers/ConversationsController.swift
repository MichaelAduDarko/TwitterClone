//
//  ConversationsController.swift
//  TwitterClone
//
//  Created by MICHAEL ADU DARKO on 3/13/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit

class ConversationsController: UIViewController {
       //MARK:- Properties
     
     //MARK:- Lifecycle

     override func viewDidLoad() {
         super.viewDidLoad()
        configureUI()
     }
     
    
        //MARK:- Helpers
        
        func configureUI() {
            view.backgroundColor = .white
            navigationItem.title = "Messages"
            
            
        }
    }


