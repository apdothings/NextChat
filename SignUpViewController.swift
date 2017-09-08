//
//  SignUpViewController.swift
//  NextChat
//
//  Created by Habib Zarrin Chang Fard on 08/09/2017.
//  Copyright © 2017 Salem Abdulla. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class SignUpViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        
        signUpUser()
        
    }
    
    func signUpUser() {
        
        guard let email = emailTextField.text,
            let password = passwordTextField.text,
            let confirmPassword = confirmPasswordTextField.text else {return}
        
        if password != confirmPassword {
            createErrorVC("Password Error", "Password does not match")
            return
        } else if email == "" || password == "" {
            createErrorVC("Missing input field", "Input field must be filled")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                self.createErrorVC("Error", error.localizedDescription)
            }
        
                self.navigationController?.popViewController(animated: true)
        }
    }
    
        
    func createErrorVC(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



