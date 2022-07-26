//
//  AddressViewController.swift
//  Foodiezz
//
//  Created by Muskan on 05/07/22.
//

import UIKit
import Firebase

class AddressViewController: UIViewController {
    
    var db = Firestore.firestore()
    var count : Double = 0
    var c : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func paymentOptionPressed(_ sender: UIButton) {
        
        load()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //super.prepare(for: segue, sender: self)
            if segue.identifier == "payment" {
                let destinationVC = segue.destination as! PlacingOrderViewController
                destinationVC.total = count * Double(c)
            }
    }
    
    func load(){
        db.collection("user").getDocuments { [self] (querySnapshot , error) in
            if error != nil{
                print("Error while loading saved data.")
            }else{
                if let snapshotDocuments = querySnapshot?.documents{
                    for doc in snapshotDocuments{
                        let data = doc.data()
                        print(Auth.auth().currentUser?.email)
                        if data["sender"] as! String  == Auth.auth().currentUser?.email {
                            c += 1
                            let  totalItem = (data["price"] as! NSString).doubleValue
                                count += totalItem
                                print("total amount = \(count)")
                            
                            
                            
                          
                        }
                        
                    }
                    performSegue(withIdentifier: "payment", sender: self)
                }
            }
        }
    }
    
    
    

}
