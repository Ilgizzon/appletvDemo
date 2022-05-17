//
//  HeaderCell.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 08.03.2021.
//

import TVUIKit

class HeaderCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.adjustsImageWhenAncestorFocused = true
        imageView.masksFocusEffectToContents = true
    }
    
    func loadImage(image: UIImage?){
       imageView.image = image
        UIView.animate(withDuration: 0.5) {
            self.imageView.alpha = 1
        }
    }
}
