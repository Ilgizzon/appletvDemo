//
//  HeaderDataSource.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 08.03.2021.
//

import UIKit
extension HeaderView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = headerData.count
        return headerData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell",
                                                      for: indexPath) as! HeaderCell
        
        if imagesNeedConvert {
            imagesNeedConvert = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                self.convertImages(size: cell.imageView.frame.size)
            })
        }
        
        if imagesConverted {
            cell.loadImage(image: headerData[indexPath.row].image)
        }
        
        return cell
    }
    
    
}
