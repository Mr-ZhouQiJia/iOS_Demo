//
//  ZXMineViewController.swift
//  DDSC_Swift
//
//  Created by ddsc on 2018/11/29.
//  Copyright © 2018 ddsc. All rights reserved.
//

import UIKit

class ZXMineViewController: BaseViewController {
    var propagandaView : UIView?
    var propagandaViewBgView : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        presentPropagandaView()
    }
    

    
}

extension ZXMineViewController {
    func presentPropagandaView() {
        self.propagandaView = UIView(frame: CGRect(x: 0, y: 0, width: ZX_WIDTH, height: ZZX_HEIGHT - 48))
        self.propagandaView?.alpha = 0.6
        self.propagandaView?.backgroundColor = UIColor.black
        self.view.addSubview(self.propagandaView!)
        
        self.propagandaViewBgView = UIView(frame: CGRect(x: 15, y: ZZX_HEIGHT - 34 - 289, width: ZX_WIDTH - 30, height: 200))
        self.propagandaViewBgView?.backgroundColor = UIColor.orange
        self.propagandaView?.addSubview(self.propagandaViewBgView!)
        
    }
}
