//
//  MainContentViewDelegate.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 10.03.2021.
//

import UIKit

extension MainContentView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? MainContentViewCell else {
            return
        }
    }
}
