//
//  BrowseView.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 09.02.2021.
//

import UIKit
class BrowseView: UIViewController {

    @IBOutlet weak var contentStack: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    let dispatchGroup = DispatchGroup()
    
    var headerData: [ContentPreview] = []
    var mainData: [CategoryPreview] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCategory()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dispatchGroup.notify(queue: .main) {
            self.configUI()
        }
        
    }
    
}
