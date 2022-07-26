//
//  LoginViewController.swift
//  Foodiezz
//
//  Created by Muskan on 04/07/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailText.text , let password = passwordText.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                
                if error != nil {
                    var alert = UIAlertController()
                    var action = UIAlertAction()
                    alert = .init(title: "Error while Logging.", message: "", preferredStyle: .alert)
                    action = .init(title: "OK", style: .default, handler: { (action) in
                        print("Okay pressed")
                    })
                    alert.addAction(action)
                    self?.present(alert, animated: true, completion: nil)
                }else{
                    self?.performSegue(withIdentifier: "loginPressed", sender: self)
                }
              
            }
        }
    }
    
}
