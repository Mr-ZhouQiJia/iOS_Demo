//
//  ZXLoginOrRegisterVCViewController.swift
//  DDSC_Swift
//
//  Created by ddsc on 2019/4/15.
//  Copyright © 2019 ddsc. All rights reserved.
//

import UIKit

class ZXLoginOrRegisterVCViewController: BaseViewController {
    var scrollView : UIScrollView?
    var contentView : UIView?
    var textField : ZXTextFeild?
    var formView : UIView?
    var tipView : ZXTipView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录/注册"  
        buildNaviBar()
        buildUI()
    }
    
    func buildNaviBar() {
        let leftButton = UIButton(type: .custom)
        leftButton.setImage(UIImage(named: "icon_nav_close_nor"), for: .normal)
        leftButton.setImage(UIImage(named: "icon_nav_close_press"), for: .highlighted)
        leftButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        let leftBarButtomItem = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = leftBarButtomItem
    }
    
    @objc func back(){
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}

extension ZXLoginOrRegisterVCViewController {
    func buildUI(){
        self.scrollView = UIScrollView()
        scrollView?.showsVerticalScrollIndicator = false
        scrollView?.showsHorizontalScrollIndicator = false
        self.view.addSubview(scrollView!)
        self.scrollView!.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        scrollView!.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.contentView = UIView()
        scrollView?.addSubview(contentView!)
        contentView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(self.scrollView!)
        })
        let label = UILabel()
        contentView?.addSubview(label)
        label.text = "输入手机号,用来登录、注册"
        label.textColor = ZX_TextColor
        label.font = UIFont.systemFont(ofSize: 14)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(contentView!).offset(10)
            make.centerX.equalTo(self.view)
            make.height.equalTo(50)
        }
        
        self.formView = UIView()
        self.contentView?.addSubview(formView!)
        formView?.backgroundColor = UIColor.white
        formView?.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(contentView!)
            make.top.equalTo(label.snp.bottom)
        }
        
        let topLabel = UILabel()
        formView?.addSubview(topLabel)
        topLabel.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "hLine")!)
        topLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(formView!)
            make.top.equalTo(formView!)
            make.height.equalTo(1)
        }
        
        self.textField = ZXTextFeild()
        formView?.addSubview(textField!)
        textField?.snp.makeConstraints({ (make) in
            make.top.equalTo(topLabel.snp.bottom)
            make.leading.equalTo(formView!).offset(15)
            make.trailing.equalTo(formView!).offset(-15)
            make.height.equalTo(40)
        })
        
        let centerLabel = UILabel()
        centerLabel.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "hLine")!)
        formView?.addSubview(centerLabel)
        centerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(textField!.snp.bottom)
            make.trailing.leading.equalTo(formView!)
            make.height.equalTo(1)
        }
        
        self.tipView = ZXTipView()
        formView?.addSubview(tipView!)
        tipView?.snp.makeConstraints({ (make) in
            make.top.equalTo(centerLabel.snp.bottom)
            make.leading.trailing.equalTo(formView!)
            make.height.equalTo(1)
        })
        
        formView?.snp.makeConstraints({ (make) in
            make.bottom.equalTo(tipView!)
        })
    }
}
