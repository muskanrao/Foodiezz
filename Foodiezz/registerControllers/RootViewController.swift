//
//  RootViewController.swift
//  Foodiezz
//
//  Created by Muskan on 08/07/22.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.cornerRadius = 50
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowRadius = 10
        loginButton.layer.shadowOffset = .zero
        
        signupButton.layer.cornerRadius = 50
        signupButton.layer.shadowOpacity = 0.5
        signupButton.layer.shadowColor = UIColor.black.cgColor
        signupButton.layer.shadowRadius = 10
        signupButton.layer.shadowOffset = .zero
        // Do any additional setup after loading the view.
    }
    

}
