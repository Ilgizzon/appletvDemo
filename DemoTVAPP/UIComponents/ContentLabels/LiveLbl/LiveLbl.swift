//
//  LiveLbl.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 15.03.2021.
//

import UIKit

class LiveLbl: UIView {


    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var labelView: UIView!
    private var text: String?
    
    public init(frame: CGRect, text: String) {
        super.init(frame: frame)
        self.text = text
        loadXIB()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXIB()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadXIB()
    }
    
    private func loadXIB() {
        subviews.forEach {
            $0.removeFromSuperview()
        }
        let bundle = Bundle.init(for: LiveLbl.self)
        if let viewsToAdd = bundle.loadNibNamed(String(describing: LiveLbl.self), owner: self, options: nil),
           let contentView = viewsToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            if #available(iOS 13.0, *) {
                overrideUserInterfaceStyle = .light
            }
            
            configUI()
        }
        
    }


    private func configUI() {
        labelView.layer.cornerRadius = 8
        labelView.clipsToBounds = true
        labelView.backgroundColor = UIConstants.Colors.red
        textLabel.font = UIConstants.Fonts.labelSemibold
        textLabel.textColor = UIConstants.Colors.white100
        textLabel.text = text
    }
}
