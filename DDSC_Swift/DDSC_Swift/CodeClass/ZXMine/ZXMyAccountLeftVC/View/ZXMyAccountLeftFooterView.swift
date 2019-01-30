//
//  ZXMyAccountLeftFooterView.swift
//  DDSC_Swift
//
//  Created by ddsc on 2019/1/25.
//  Copyright © 2019 ddsc. All rights reserved.
//

import UIKit

class ZXMyAccountLeftFooterView: BaseView {

    @IBOutlet weak var telView: UIView!
    
    @IBOutlet weak var bottomTelNumLabel: UILabel!
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        telView.layer.masksToBounds = true
        telView.layer.cornerRadius = 5
        let tel = bottomTelNumLabel.text
        let attriTel = NSMutableAttributedString.init(string: tel!)
        attriTel.addAttributes([NSAttributedString.Key.foregroundColor : UIColor(red: 123/255.0, green: 208/255.0, blue: 255/255.0, alpha: 1)], range: NSRange.init(location: 5, length: (tel?.count)! - 5))
        bottomTelNumLabel.attributedText = attriTel
        
    }
    

}
