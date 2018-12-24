//
//  BaseTabBarVC.swift
//  DDSC_Swift
//
//  Created by ddsc on 2018/11/28.
//  Copyright © 2018 ddsc. All rights reserved.
//

import UIKit

class BaseTabBarVC: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        let selectedAttributes:Dictionary = [NSAttributedString.Key.foregroundColor : UIColor.red ]
        
        self.tabBarItem.setTitleTextAttributes(selectedAttributes, for:.selected)
        let normalAttributes = [NSAttributedString.Key.foregroundColor : UIColor.yellow]
        self.tabBarItem.setTitleTextAttributes(normalAttributes, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
