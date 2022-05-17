//
//  BrowseRouter.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 09.02.2021.
//

import Foundation
extension BrowseView {
    
    static func getView() -> BrowseView {
        let view = BrowseView(nibName: "BrowseView", bundle: nil)
        return view
    }
}
