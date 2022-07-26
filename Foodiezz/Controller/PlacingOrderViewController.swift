//
//  PlacingOrderViewController.swift
//  Foodiezz
//
//  Created by Muskan on 03/07/22.
//

import UIKit
import FirebaseAuth
import Firebase

class PlacingOrderViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    var total : Double = 0
    var db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = "$\(total)"
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        navigationController?.popToRootViewController(animated: true)
      
        
        
    }
    
}
