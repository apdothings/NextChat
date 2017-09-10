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
    @IBOutlet weak var signInBtn: UIButton! {
        didSet {
            signInBtn.addTarget(self, action: #selector(signInBtnTapped), for: .touchUpInside)
        }
    }
    @IBOutlet weak var signUpBtn: UIButton! {
        didSet {
            signUpBtn.addTarget(self, action: #selector(signUpBtnTapped), for: .touchUpInside)
        }
    }
    
    func signInBtnTapped() {
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        if emailTextField.text == "" {
            createErrorVC(title: "Empty email fill", message: "Please input valid email")
            return
        } else if passwordTextField.text == "" {
            createErrorVC(title: "Empty password fill", message: "Please input valid password fill")
            return
        }
        
        
        
        
    }
    
    func signUpBtnTapped() {
        
    }
    
    func createErrorVC(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //check if there is any user logged in
        //If yes, we go ChatViewController which is inside ChatViewStoryboard (different storyBoard)
        if Auth.auth().currentUser != nil {
            let ChatViewStoryboard = UIStoryboard(name: "ChatViewStoryboard", bundle: Bundle.main)
            let chatVC = ChatViewStoryboard.instantiateViewController(withIdentifier: "TheChatViewController")
            
            window.rootViewController = chatVC
            window.makeKeyAndVisible()
        }
    }
    
    
}
