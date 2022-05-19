//
//  MainContentViewCell.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 10.03.2021.
//

import TVUIKit

class MainContentViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contentTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.adjustsImageWhenAncestorFocused = true
        imageView.masksFocusEffectToContents = true
        contentTitle.font = UIConstants.Fonts.bodyMedium
        contentTitle.textColor = UIConstants.Colors.grey80
    }
    
    func loadImage(_ image: UIImage?){
        imageView.image = image
        
        guard imageView.alpha == 0 else {
            return
        }
        
        UIView.animate(withDuration: 0.5) {
            self.imageView.alpha = 1
        }
    }
    
    func loadTitle(_ title: String?) {
        contentTitle.text = title
    }
    
    func setLiveLabel(_ text: String) {
        let view = ContentLabel.create(
            frame: imageView.bounds,
            type: .live(text)
        )
        
        setLabel(view: view)
    }
    
    func setTimestampLabel(_ time: Int?) {
        let view = ContentLabel.create(
            frame: imageView.bounds,
            type: .timestamp(time)
        )
        
        setLabel(view: view)
    }
    
    func setPlaylisLabel(_ text: String) {
        let view = ContentLabel.create(
            frame: imageView.bounds,
            type: .playlist(text)
        )
        
        setLabel(view: view)
    }
    
    private func setLabel(view: UIView) {
        imageView.overlayContentView.subviews.forEach{
            $0.removeFromSuperview()
        }
        
        imageView.overlayContentView.addSubview(view)
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if context.nextFocusedView == self {
            focusAnimation()
        } else {
            defocusAnimation()
        }
    }
    
    private func focusAnimation() {
        UIView.animate(withDuration: 0.5) {
            
            self.contentTitle.transform = self.contentTitle.transform.translatedBy(x: 0, y: 20)
            self.contentTitle.textColor = UIConstants.Colors.grey100
            
        }
    }
    
    private func defocusAnimation() {
        UIView.animate(withDuration: 0.5) {
            self.contentTitle.transform = CGAffineTransform.identity
            self.contentTitle.textColor = UIConstants.Colors.grey80
        }
    }
}
