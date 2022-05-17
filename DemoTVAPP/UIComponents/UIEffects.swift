//
//  UIEffects.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 31.01.2021.
//

import UIKit

class UIEffects {
    
    static func grey60Liner(view: UIView?) {
        guard let view = view else {
            return
        }
        
        let layer = CAGradientLayer()

        layer.colors = [
            UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 0).cgColor,
            UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 0.4).cgColor
        ]
        layer.locations = [0, 1]
        layer.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1.06, c: -1.06, d: 0, tx: 1.03, ty: -0.06))
        layer.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        layer.position = view.center
        view.layer.addSublayer(layer)
    }
    
    static func grey60LinerBottom(view: UIView?) {
        guard let view = view else {
            return
        }
        
        let layer = CAGradientLayer()

        layer.colors = [
            UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 0).cgColor,
            UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 0.4).cgColor
        ]
        layer.locations = [0, 1]
        layer.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
        layer.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        layer.position = view.center
        view.layer.addSublayer(layer)
    }
    
    static func greyGradient(view: UIView?) {
        guard let view = view else {
            return
        }
        
        let layer0 = CAGradientLayer()
        
        layer0.colors = [
            UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 0.6).cgColor,
            UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 0).cgColor
        ]

        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: -0.5, c: 0.5, d: 0, tx: 0.25, ty: 1))
        layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        layer0.position = view.center
        view.layer.addSublayer(layer0)
        
        let layer1 = CAGradientLayer()

        layer1.colors = [
            UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 0.28).cgColor,
            UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 0.28).cgColor,
            UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 0).cgColor,
            UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 0).cgColor
        ]

        layer1.locations = [0, 0, 1, 1]
        layer1.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer1.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer1.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
        layer1.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        layer1.position = view.center
        view.layer.addSublayer(layer1)
    }
    
    static func blurOverlay(view: UIView?) {
        
        guard let view = view else {
            return
        }
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.alpha = 0.9
        view.addSubview(blurEffectView)
    }
    
    static func blurBottom(view: UIView?) {
        
        guard let view = view else {
            return
        }
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.alpha = 0.9
        view.addSubview(blurEffectView)

    }
    
    static func blurTimestamp(view: UIView?) {
        
        guard let view = view else {
            return
        }
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.alpha = 0.9
        view.addSubview(blurEffectView)
    
    }
    
    static func shadowHighligheted(view: UIView? ) {
        guard let view = view else {
            return
        }
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 60
        view.layer.shadowOffset = CGSize(width: 0, height: 32)
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
    }
}
