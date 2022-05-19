//
//  ContentPreview.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 14.04.2021.
//

import UIKit

class ContentPreview {
    
    enum PreviewContentType {
        case live
        case collection(_ count: Int?)
        case video(_ durationInSec: Int?)
    }
    let id: Int
    let title: String?
    let description: String?
    let imageUrl: String?
    let contentType: PreviewContentType?
    var image: UIImage?
    
    init(id: Int, title: String?, description: String?, imageUrl: String?, contentType: PreviewContentType? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.imageUrl = imageUrl
        self.contentType = contentType
    }
}
