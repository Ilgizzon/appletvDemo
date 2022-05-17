//
//  TabBarView.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 09.02.2021.
//

import UIKit

class TabBarView: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configUI()
    }
    
}
