//
//  MainContentView.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 09.03.2021.
//

import UIKit

class MainContentView: UIView {


    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    weak var delegate: ContentDelegate?
    var content: [ContentPreview] = []
    var titleContents: String?
    var categoryId: Int?
    
    private let imageDipatchGroup = DispatchGroup()
    let networkDipatchGroup = DispatchGroup()
    var imagesConverted = false
    var imagesNeedConvert = true
    
    public init(frame: CGRect, delegate: ContentDelegate) {
        super.init(frame: frame)
        self.delegate = delegate
        loadXIB()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXIB()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadXIB()
    }
    
    func loadContent(){
        guard let id = categoryId else {
            return
        }
        networkDipatchGroup.enter()
        DispatchQueue.global(qos: .userInitiated).async {
            self.getContents(id: id)
        }
        
        networkDipatchGroup.notify(queue: .main) {
            self.collectionView.reloadData()
        }
    }
    
    private func loadXIB() {
        subviews.forEach {
            $0.removeFromSuperview()
        }
        let bundle = Bundle.init(for: MainContentView.self)
        if let viewsToAdd = bundle.loadNibNamed(String(describing: MainContentView.self), owner: self, options: nil),
           let contentView = viewsToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            
            if #available(iOS 13.0, *) {
                overrideUserInterfaceStyle = .light
            }
            
            configUI()
        }
        
    }

    
    func convertImages(size: CGSize) {
        
        var tempContent: [ContentPreview] = []
        
        for contentItem in content {
            guard let imageUrl = contentItem.imageUrl, let url = URL(string: imageUrl) else { return }
            imageDipatchGroup.enter()
            DispatchQueue.global(qos: .userInitiated).async {
                let image = UIImage()
                let contentData = image.loadFromURL(url: url, id: contentItem.id)
                
                guard let finalImage = contentData.0?.roundedImage(corners: UIRectCorner.allCorners, radius: 12, size: size, id: contentData.1) else {
                    self.imageDipatchGroup.leave()
                    return
                }
                
                guard let contentStrong = self.getCurrentContent(id: finalImage.1) else {
                    self.imageDipatchGroup.leave()
                    return
                }
                
                contentStrong.image = finalImage.0
                tempContent.append(contentStrong)
                
                self.imageDipatchGroup.leave()
            }
        }
        
        imageDipatchGroup.notify(queue: .main) {
            self.content = tempContent
            self.imagesConverted = true
            self.collectionView.reloadData()
        }
        
    }
    
    func getCurrentContent(id: Int) -> ContentPreview? {
        
        return content.filter{ $0.id == id }.first
    }
}
