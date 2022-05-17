//
//  BrowseUI.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 09.02.2021.
//

import UIKit
import TVUIKit
extension BrowseView {
    func configUI() {
        self.view.backgroundColor = UIConstants.Colors.grey100
        self.contentStack.subviews.forEach{
            $0.removeFromSuperview()
        }
        
        let header = HeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 640))
        header.headerData = headerData
        self.contentStack.addArrangedSubview(header)
        
        for main in mainData {
            let viewContent = MainContentView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 380))
            viewContent.titleContents = main.title
            viewContent.categoryId = main.id
            viewContent.loadContent()
            self.contentStack.addArrangedSubview(viewContent)
        }
        
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        footer.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        footer.backgroundColor = .clear
        self.contentStack.addArrangedSubview(footer)
        
        self.tabBarObservedScrollView = scrollView
    }

}
