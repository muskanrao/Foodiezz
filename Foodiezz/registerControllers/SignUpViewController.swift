//
//  SignUpViewController.swift
//  Foodiezz
//
//  Created by Muskan on 04/07/22.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

   
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func signupPressed(_ sender: UIButton) {
        
        if let email = emailText.text , let password = passwordText.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if error != nil{
                    print(error)
                    var alert = UIAlertController()
                    var action  = UIAlertAction()
                    alert = .init(title: "Error while signing Up.", message: "", preferredStyle: .alert)
                    action = .init(title: "OK", style: .default, handler: { (action) in
                        print("Okay pressed.")
                    })
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }else{
                  
                    self.performSegue(withIdentifier: "signupPressed", sender: self)
                }
            }
        }
        
        
        
    }
    

}


 
 /*
  let selectedSeat = tableArray[indexPath.row]
  let storedData = Auth.auth().currentUser?.email
  db.collection("user").addDocument(data: ["sender": storedData,"bookedSeat":selectedSeat]) { (error) in
      if let e = error{
          print("There  is issue while saving data to firestore.\(e)")
      }else{
          print("Succesfully saved")
      }
  }
  
  func loadBooking(){
      var booking = ""
      db.collection("user").getDocuments { (querySnapshot , error) in
          if error != nil{
              print("Error while loading saved data.")
          }else{
              if let snapshotDocuments = querySnapshot?.documents{
                  for doc in snapshotDocuments{
                      let data = doc.data()
                      print(Auth.auth().currentUser?.email)
                      if data["sender"] as! String  == Auth.auth().currentUser?.email {
                          booking = data["bookedSeat"] as! String
                          self.item = booking
                          print(booking)
                          self.performSegue(withIdentifier: "ToViewBook", sender: self)
                          break
                        
                      } //let booking = data["bookedSeat"] as? String{
                          
                          //self.performSegue(withIdentifier: "ToViewBook", sender: self)
                          // print(sender)
                          
                          //self.item = booking
                      }
                  }
              }
          }
      }
  }
  */

