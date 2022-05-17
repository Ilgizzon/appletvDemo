//
//  MainContentInteractor.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 22.04.2021.
//

import Foundation
extension MainContentView {
    
    func getContents(id: Int){
    
    }
    
    private func parseData(_ networkContents: [Content]?){
        guard let contentsStrong = networkContents else {
            self.networkDipatchGroup.leave()
            return
        }
        
        for (index, oneContent) in contentsStrong.enumerated() {
            var contentType: ContentPreview.PreviewContentType?
            
            switch oneContent.contentType {
            case .liveEvent:
                contentType = .live
                break
            case .collection:
                contentType = .collection(oneContent.children?.count)
                break
            case .video:
                contentType = .video(oneContent.duration)
                break
            case .none:
                break
            }
            
            let previewContent = ContentPreview(id: oneContent.id, title: oneContent.title, description: oneContent.description, imageUrl: oneContent.preview, contentType: contentType)
            
            content.append(previewContent)
            if index + 1 == contentsStrong.count {
                self.networkDipatchGroup.leave()
            }
            
        }
    }
    
}
