//
//  ZXRecommendViewController.swift
//  DDSC_Swift
//
//  Created by ddsc on 2018/11/29.
//  Copyright © 2018 ddsc. All rights reserved.
//

import UIKit

class ZXRecommendViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapMe))
        self.view.addGestureRecognizer(tap)
    }
    @objc func tapMe() {
        print("tapMe")
    }
    
}
