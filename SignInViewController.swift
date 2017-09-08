//
//  SignInViewController.swift
//  NextChat
//
//  Created by Alex Koh on 08/09/2017.
//  Copyright © 2017 Salem Abdulla. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    
    var window = UIWindow()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //check if there is any user logged in
        //If yes, we go ChatViewController which is inside ChatViewStoryboard
        if Auth.auth().currentUser != nil {
            let ChatViewStoryboard = UIStoryboard(name: "ChatViewStoryboard", bundle: Bundle.main)
            let chatVC = ChatViewStoryboard.instantiateViewController(withIdentifier: "TheChatViewController")
            
            window.rootViewController = chatVC
            window.makeKeyAndVisible()
        }
    }
}
