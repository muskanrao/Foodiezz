//
//  OnboardingCollectionViewCell.swift
//  Foodiezz
//
//  Created by Muskan on 27/06/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImage: UIImageView!
    @IBOutlet weak var slideTitle: UILabel!
    @IBOutlet weak var slideDescription: UILabel!
    
    func setup(_ slide: OnboardingSlide){
        slideImage.image = slide.image
        slideTitle.text = slide.title
        slideDescription.text = slide.desription
    }
    
}
