//
//  ImageViewExtensions.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 10.03.2021.
//

import UIKit

extension UIImage{
    func roundedImage(corners: UIRectCorner, radius: CGFloat, size: CGSize, id: Int) -> (UIImage, Int) {
        
        let rect = CGRect(origin: .zero, size: size)

        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        
        UIBezierPath(
            roundedRect: rect,
            cornerRadius: radius
        ).addClip()
        
        self.draw(in: rect)
        let temp = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return (temp, id)
    }
    
    func loadFromURL(url: URL, id: Int) -> (UIImage?, Int) {
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                return(image, id)
            }
            return(nil, id)
        }
        return(nil, id)
    }
    
    public convenience init?(color: UIColor, size: CGSize) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
        defer {
            UIGraphicsEndImageContext()
        }
    }
}
