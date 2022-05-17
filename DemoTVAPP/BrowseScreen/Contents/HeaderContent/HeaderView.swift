//
//  HeaderView.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 08.03.2021.
//

import UIKit

class HeaderView: UIView {


    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    weak var delegate: ContentDelegate?
    var headerData: [ContentPreview] = []
    private let dipatchGroup = DispatchGroup()
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
    
    private func loadXIB() {
        subviews.forEach {
            $0.removeFromSuperview()
        }
        let bundle = Bundle.init(for: HeaderView.self)
        if let viewsToAdd = bundle.loadNibNamed(String(describing: HeaderView.self), owner: self, options: nil),
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


    private func configUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(HeaderCell.self, forCellWithReuseIdentifier: "HeaderCell")
        collectionView.register(UINib(nibName: "HeaderCell", bundle: nil),
                                 forCellWithReuseIdentifier: "HeaderCell")
        let flowLayout = UICollectionViewFlowLayout()

        flowLayout.itemSize = CGSize(width: 1740.0, height: 640.0)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 60
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.collectionViewLayout = flowLayout
        collectionView.reloadData()
        pageControl.currentPage = 0
    }
    
    func convertImages(size: CGSize) {
        
        var tempImages: [ContentPreview] = []
        
        for imageHeader in headerData {
            guard let imageUrl = imageHeader.imageUrl, let url = URL(string: imageUrl) else { return }
            dipatchGroup.enter()
            DispatchQueue.global(qos: .userInitiated).async {
                let image = UIImage()
                let contentData = image.loadFromURL(url: url, id: imageHeader.id)
                guard let finalImage = contentData.0?.roundedImage(corners: UIRectCorner.allCorners, radius: 16, size: size, id: contentData.1) else {
                    self.dipatchGroup.leave()
                    return
                }
                guard let content = self.getCurrentContent(id: finalImage.1) else {
                    self.dipatchGroup.leave()
                    return
                }
                
                content.image = finalImage.0
                tempImages.append(content)
                self.dipatchGroup.leave()
            }
        }
        
        dipatchGroup.notify(queue: .main) {
            self.headerData = tempImages
            self.imagesConverted = true
            self.collectionView.reloadData()
        }
        
    }
    
    func getCurrentContent(id: Int) -> ContentPreview? {
        
        return headerData.filter{ $0.id == id }.first
    }
}
