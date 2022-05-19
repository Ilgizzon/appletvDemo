//
//  BrowseInteractor.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 13.04.2021.
//

import Foundation

extension BrowseView {
    func getCategory(){
        dispatchGroup.enter()
        parseData(data: MockCategoriesResponse.generate())
    }
    
    
    func parseData(data: CategoriesResponse) {
        guard let categories = data.categories else {
            self.dispatchGroup.leave()
            return
        }
        
        for oneCategory in categories {
            self.dispatchGroup.enter()
            
            if oneCategory.featured == false {
                let categoryPreview = CategoryPreview(id: oneCategory.id, title: oneCategory.title)
                mainData.append(categoryPreview)
            } else {
                let contentPreview = ContentPreview(id: oneCategory.id, title: oneCategory.title, description: oneCategory.description, imageUrl: oneCategory.image)
                
                headerData.append(contentPreview)
            }
            self.dispatchGroup.leave()
        }
        self.dispatchGroup.leave()
    }
     
}
