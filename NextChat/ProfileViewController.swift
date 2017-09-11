//
//  ProfileViewController.swift
//  NextChat
//
//  Created by Habib Zarrin Chang Fard on 08/09/2017.
//  Copyright © 2017 Salem Abdulla. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage


class ProfileViewController: UIViewController {
    
    
    var selectedUser : Users?
    var ref : DatabaseReference!
    var isEdit: Bool = true
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var editButton: UIButton!{
        
        didSet{
            editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
            
        }
        
    }
    
    @IBAction func LogOutButton(_ sender: Any) {
        
//        signoutbutton.addTarget(self, action: #selector(signUpUser), for: .touchUpInside)
        
    }
    
    func editButtonTapped(){
        
        if isEdit == true {
            
            userNameTextField.isUserInteractionEnabled = true
            editButton.setTitle("Done", for: .normal)
            isEdit = false
        }
        else  {
            
            ref = Database.database().reference()
            guard let email = selectedUser?.email,
            let id = selectedUser?.usersID
            
            
            else{return}
            
            let post : [String : Any] = ["emailAddress" : email]
            
            //dig paths to reach a specific student
            ref.child("users").child("\(id)").updateChildValues(post)
            //ref.child(<#T##pathString: String##String#>).se
            editButton.setTitle("Edit", for: .normal)
            isEdit = true
            
            userNameTextField.isUserInteractionEnabled = false
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let user = selectedUser?.email
        else {return}
        
        userNameTextField.text = user
        editButton.titleLabel?.text = "Edit"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
