//
//  cardView.swift
//  Foodiezz
//
//  Created by Muskan on 28/06/22.
//

import Foundation
import UIKit

class cardView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup(){
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowRadius = 0.1
        cornerRadius = 10
        
    }
    
}
