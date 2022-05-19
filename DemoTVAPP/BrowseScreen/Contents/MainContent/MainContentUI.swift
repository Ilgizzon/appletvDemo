//
//  MainContentUI.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 22.04.2021.
//

import UIKit

extension MainContentView {
    
    func configUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(MainContentViewCell.self, forCellWithReuseIdentifier: "MainContentViewCell")
        collectionView.register(UINib(nibName: "MainContentViewCell", bundle: nil),
                                 forCellWithReuseIdentifier: "MainContentViewCell")
        let flowLayout = UICollectionViewFlowLayout()

        flowLayout.itemSize = CGSize(width: 408.0, height: 280.0)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 60
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.collectionViewLayout = flowLayout
        collectionView.reloadData()
        
        titleLabel.font = UIConstants.Fonts.title3Bold
        titleLabel.textColor = UIConstants.Colors.grey80
    }
}
