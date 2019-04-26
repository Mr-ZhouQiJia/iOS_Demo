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
    var hadLogin : Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.hadLogin = false
        if !hadLogin! {
            presentPropagandaView()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool){
        super.viewDidDisappear(true)
        if self.view.subviews.contains(self.propagandaView!) {
            self.propagandaView!.removeFromSuperview()
        }
    }
}

extension ZXMineViewController {
    func presentPropagandaView() {
        self.propagandaView = UIView(frame: CGRect(x: 0, y: 0, width: ZZX_WIDTH, height: ZZX_HEIGHT - 48))
        self.propagandaView?.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.view.addSubview(self.propagandaView!)
        
        self.propagandaViewBgView = UIView(frame: CGRect(x: 15, y: ZZX_HEIGHT - 34 - 289, width: ZZX_WIDTH - 30, height: 200))
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
        
        //左侧部分
        let leftView = UIView()
        self.propagandaViewBgView?.addSubview(leftView)
        let leftPic = UIImageView(image: UIImage(named: "icon_Myassets_guangfayinhang"))
        leftView.addSubview(leftPic)
        let leftLabel = UILabel()
        leftLabel.text = "资金银行存管"
        leftLabel.font = UIFont.systemFont(ofSize: 10)
        leftLabel.textColor = UIColor.white
        leftView.addSubview(leftLabel)
        leftView.snp.makeConstraints { (make) in
            make.left.equalTo(propagandaViewBgView!.snp.left).offset(70)
            make.top.equalTo(propagandaViewBgView!)
            make.bottom.equalTo(leftLabel.snp.top)
            make.trailing.equalTo(leftPic)
        }
        
        leftPic.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(leftView)
            make.height.width.equalTo(71)
        }
        
        leftLabel.snp.makeConstraints { (make) in
            make.top.equalTo(leftPic.snp.bottom).offset(5)
            make.centerX.equalTo(leftView)
        }
        
        //右侧部分
        let rightView = UIView()
        self.propagandaViewBgView?.addSubview(rightView)
        let rightPic = UIImageView(image: UIImage(named: "icon_Myassets_tongkajinchu"))
        rightView.addSubview(rightPic)
        let rightLabel = UILabel()
        rightLabel.text = "资金同卡进出"
        rightLabel.font = UIFont.systemFont(ofSize: 10)
        rightLabel.textColor = UIColor.white
        rightView.addSubview(rightLabel)
        rightView.snp.makeConstraints { (make) in
            make.right.equalTo(propagandaViewBgView!.snp.right).offset(-70)
            make.top.equalTo(propagandaViewBgView!)
            make.bottom.equalTo(rightLabel.snp.top)
            make.trailing.equalTo(rightPic)
        }
        
        rightPic.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(rightView)
            make.height.width.equalTo(71)
        }
        
        rightLabel.snp.makeConstraints { (make) in
            make.top.equalTo(rightPic.snp.bottom).offset(5)
            make.centerX.equalTo(rightView)
        }
        
        //infoView
        let infoView = UIView()
        self.propagandaViewBgView?.addSubview(infoView)
        let infoPic = UIImageView(image: UIImage(named: "icon_Myassets_yangguangbaoxian"))
        infoView.addSubview(infoPic)
        let infoLabel = UILabel()
        infoLabel.text = "账号资金由恒丰银行存管"
        infoLabel.font = UIFont.systemFont(ofSize: 12)
        infoLabel.textColor = UIColor(red: 0.21, green: 0.65, blue: 0.76, alpha: 1.0)
        infoLabel.numberOfLines = 0
        
        infoView.addSubview(infoLabel)
        infoView.snp.makeConstraints { (make) in
            make.bottom.equalTo(loginButton!.snp.top).offset(-20)
            make.centerX.equalTo(propagandaViewBgView!)
            make.top.trailing.equalTo(infoLabel)
        }
        infoPic.snp.makeConstraints { (make) in
            make.leading.bottom.equalTo(infoView)
            make.width.height.equalTo(15)
        }
        infoLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(infoPic.snp.trailing).offset(5)
            make.centerY.equalTo(infoPic)
        }
        
        if !hadLogin! {
            leftView.alpha = 0
            rightView.alpha = 0
            infoView.alpha = 0
            
            UIView.animate(withDuration: 0.3) {
                var leftFrame = leftView.frame
                leftFrame.origin.y = leftFrame.origin.y + 20
                leftView.frame = leftFrame
                leftView.alpha = 1.0
            }
          
            UIView.animate(withDuration: 0.2, delay: 0.3, options: .allowAnimatedContent, animations: {
                var rightFrame = rightView.frame
                rightFrame.origin.y = rightFrame.origin.y + 20
                rightView.frame = rightFrame
                rightView.alpha = 1.0
                var infoViewFrame = infoView.frame
                infoViewFrame.origin.y = infoViewFrame.origin.y - 20
                infoView.frame = infoViewFrame
                infoView.alpha = 1.0
            }, completion: nil)
            
        }
        
        
        
        self.view.bringSubviewToFront(self.propagandaViewBgView!)
    }
    
    @objc func loginOrRegisterClicked() {
        
        let loginVC = ZXLoginOrRegisterVCViewController()
        let navigationVC = BaseNavigationVC(rootViewController: loginVC)
        self.navigationController?.present(navigationVC, animated: true, completion: nil)
        
    }
}

