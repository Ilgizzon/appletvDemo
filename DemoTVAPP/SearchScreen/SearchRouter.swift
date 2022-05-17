//
//  SearchRouter.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 09.02.2021.
//

import Foundation
extension SearchView {
    
    static func getView() -> SearchView {
        let view = SearchView(nibName: "SearchView", bundle: nil)
        return view
    }
    
}
