//
//  HeaderDelegate.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 08.03.2021.
//
import UIKit

extension HeaderView : UICollectionViewDelegate {
    

    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? HeaderCell else {
            return
        }
        //self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let page = context.nextFocusedIndexPath?.row else {
            return
        }
        pageControl.currentPage = page
    }
}
