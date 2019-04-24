//
//  BaseViewController.swift
//  DDSC_Swift
//
//  Created by ddsc on 2018/11/28.
//  Copyright © 2018 ddsc. All rights reserved.
//

import UIKit
    
class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.color(hexString: "#F0F0F0", alpha: 1.0)
        
        // Do any additional setup after loading the view.
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
