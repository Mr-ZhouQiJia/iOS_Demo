//
//  ZXInputView.swift
//  DDSC_Swift
//
//  Created by ddsc on 2019/4/23.
//  Copyright © 2019 ddsc. All rights reserved.
//

import UIKit

class ZXInputView: BaseView {
  
    
    
    
    

}

class ZXTipView: BaseView {
    var label : UILabel?
    override init(frame: CGRect) {
        super.init(frame:.zero)
        self.backgroundColor = UIColor.red
        
        //self.backgroundColor = UIColor.color(hexString: "FEE1B7")
        buildUI()
    }
    
    override func invalidateIntrinsicContentSize() {
        self.frame.size = CGSize.init(width: ZZX_WIDTH, height: 40)
    }
    
    func buildUI() {
        label = UILabel()
//        self.addSubview(label!)
//        label?.textAlignment = NSTextAlignment.center
//        label?.textColor = UIColor.color(hexString: "ff5933")
//        label?.font = UIFont.systemFont(ofSize: 18)
//        label?.snp.makeConstraints({ (make) in
//            make.center.equalTo(self)
//            //make.edges.equalTo(self)
//        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


