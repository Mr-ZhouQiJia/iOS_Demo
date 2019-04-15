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
    var loginButton : UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        presentPropagandaView()
    }
    
}

extension ZXMineViewController {
    func presentPropagandaView() {
        self.propagandaView = UIView(frame: CGRect(x: 0, y: 0, width: ZX_WIDTH, height: ZZX_HEIGHT - 48))
        self.propagandaView?.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.view.addSubview(self.propagandaView!)
        
        self.propagandaViewBgView = UIView(frame: CGRect(x: 15, y: ZZX_HEIGHT - 34 - 289, width: ZX_WIDTH - 30, height: 200))
        //self.propagandaViewBgView?.backgroundColor = UIColor.black
        //self.propagandaViewBgView?.alpha = 0.8
        self.propagandaView?.addSubview(self.propagandaViewBgView!)
        self.loginButton = UIButton(type: .system)
        self.propagandaViewBgView!.addSubview(self.loginButton!)
        
        self.loginButton?.setTitle("登录/注册赚钱", for: .normal)
        self.loginButton?.setTitleColor(UIColor.white, for: .normal)
        self.loginButton?.addTarget(self, action: #selector(loginOrRegisterClicked), for: .touchUpInside)
        //self.loginButton?.backgroundColor = UIColor.color(hexString: "0xF65A35")
        self.loginButton?.backgroundColor = UIColor.orange
        self.loginButton?.snp.makeConstraints({ (make) in
            make.bottom.left.right.equalTo(self.propagandaViewBgView!)
            make.height.equalTo(40)
        })
        
        let redpacketImage = UIImageView(image: UIImage.init(named: "icon_Myassets_redpacket"))
        self.propagandaViewBgView?.addSubview(redpacketImage)
        redpacketImage.snp.makeConstraints { (make) in
            make.bottom.equalTo(loginButton!.snp.bottom).offset(-10)
            make.right.equalTo(loginButton!.snp.right).offset(-40)
            make.width.equalTo(35)
            make.height.equalTo(43)
        }
        
        self.view.bringSubviewToFront(self.propagandaViewBgView!)
    }
    
    @objc func loginOrRegisterClicked() {
        
        let loginVC = ZXLoginOrRegisterVCViewController()
        let navigationVC = BaseNavigationVC(rootViewController: loginVC)
        self.navigationController?.present(navigationVC, animated: true, completion: nil)
        
    }
}

