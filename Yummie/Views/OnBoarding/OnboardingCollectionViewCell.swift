//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by MACBOOK on 04/08/2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescription: UILabel!
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideDescription.text = slide.description
        slideTitleLabel.text = slide.title
        
        
        
    }
}
