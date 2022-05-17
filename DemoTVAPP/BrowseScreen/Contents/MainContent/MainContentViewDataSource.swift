//
//  MainContentViewDataSource.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 10.03.2021.
//

import UIKit

extension MainContentView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titleLabel.text = titleContents
        return content.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainContentViewCell",
                                                      for: indexPath) as! MainContentViewCell
        
        if imagesNeedConvert {
            imagesNeedConvert = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                self.convertImages(size: cell.imageView.frame.size)
            })
        }
        
        if imagesConverted {
            let oneItem = content[indexPath.row]
            cell.loadImage(oneItem.image)
            cell.loadTitle(oneItem.title)
            
            switch oneItem.contentType {
            case .collection(let count):
                cell.setPlaylisLabel("\(count ?? 0)")
            case .live:
                cell.setLiveLabel("Live")
            case .video(let durationInSec):
                cell.setTimestampLabel(durationInSec)
            case .none:
                break
 
            }
        }
        return cell
    }
    
    
    
}
