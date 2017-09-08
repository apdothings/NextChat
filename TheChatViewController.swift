//
//  TheChatViewController.swift
//  NextChat
//
//  Created by Salem Abdulla on 9/8/17.
//  Copyright © 2017 Salem Abdulla. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase

class TheChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var ref :DatabaseReference!
    
    var Users : [User] = []
    
    var chatText : [String] = ["Example","Hi", "How are you"]
    
    
    var textType : [String] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    @IBOutlet weak var textField: UITextField!
    
    
    
    @IBOutlet weak var sendButtonTappedOn: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchUsers()
        
        sendButtonTappedOn.addTarget(self, action: #selector(AddText), for: .touchUpInside)
        
        
        let chatSB = UIStoryboard(name: "TheChatViewStoryboard", bundle: Bundle.main)
        chatSB.instantiateViewController(withIdentifier: "TheChatViewController")
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatText.count
    }
    func tableView2(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textType.count
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let row =  indexPath.row
        
//        let toDo = users[row]
        
        
        
        let toDe = chatText[row]
        
        
    cell.textLabel?.text = toDe
    cell.detailTextLabel?.text = "username"

        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = UIColor.yellow
        
        guard let cell = tableView.cellForRow(at:
            indexPath) else {return}
        
        
        
        
        cell.contentView.backgroundColor = color
        
    }
    
    //add todoitems
    
    func AddText(){
        guard let newItem = textField.text  else {
            return
        }
        //adding items
        chatText.append(newItem)
        //reload tableview
        
        tableView.reloadData()
        
        //remote textfield
        textField.text = ""
 
    }
    func fetchUsers(){
        
        ref = Database.database().reference()
        
        // observe child added work as a loop return each child individually
        
        ref.child("students").observe(.childAdded, with: { (snapshot) in
            guard let info = snapshot.value as? [String : Any] else {return}
            
            print("info: \(info)")
            print(snapshot)
            print(snapshot.key)
            
            // cast snapshot.value to correct datatype
            
            if let age = info["age"] as? Int,
                {
                
                //create new student object
                
                let newUser = User(anAge: age)
                
                // append to student arry
                self.Users.append(newUser)
                self.tableView.reloadData()
                
                
                
            }
            
        }


}
