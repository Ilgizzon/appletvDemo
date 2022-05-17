//
//  ContentLabel.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 15.03.2021.
//

import UIKit

class ContentLabel {
    
    enum ContentLabelType {
        case live(_ text: String)
        case timestamp(_ text: Int?)
        case playlist(_ text: String)
    }
    
    static func create(frame: CGRect, type: ContentLabelType) -> UIView {
        
        switch type {
        case .live(let text):
            return LiveLbl(frame: frame, text: text)
        case .timestamp(let text):
            return TimeStampLbl(frame: frame, time: text)
        case .playlist(let text):
            return PlaylistLbl(frame: frame, text: text)
        }
    }
    
}
