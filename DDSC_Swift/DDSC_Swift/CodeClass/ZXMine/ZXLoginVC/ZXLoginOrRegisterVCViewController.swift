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
    var heightConstraint : NSLayoutConstraint?
    var nextButton : UIButton?
    var count = 0
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

extension ZXLoginOrRegisterVCViewController:UITextFieldDelegate {
    
    func buildUI(){
        self.scrollView = UIScrollView()
        scrollView?.showsVerticalScrollIndicator = false
        scrollView?.showsHorizontalScrollIndicator = false
        self.view.addSubview(scrollView!)
//        self.scrollView!.snp.makeConstraints { (make) in
//            make.edges.equalTo(self.view)
//        }
        scrollView!.frame = self.view.bounds
        scrollView!.contentInset = UIEdgeInsets(top: ZX_NaviBarHeight, left: 0, bottom: 0, right: 0)
        scrollView?.contentSize = IS_iPhone5 ? CGSize.init(width: ZZX_WIDTH, height: ZZX_HEIGHT + 50) :CGSize.init(width: ZZX_WIDTH, height: ZZX_HEIGHT)
        self.contentView = UIView()
        scrollView?.addSubview(contentView!)
        contentView!.snp.makeConstraints({ (make) in
            make.bottom.equalTo(scrollView!)
            make.top.equalTo(scrollView!)
            make.leading.trailing.equalTo(scrollView!)
            make.width.equalTo(self.view)
            make.height.equalTo(IS_iPhone5 ? ZZX_HEIGHT + 50 : ZZX_HEIGHT)
        })
        let endEditButton = UIButton(type: .custom)
        contentView?.addSubview(endEditButton)
        endEditButton.addTarget(self, action: #selector(endEdit), for: .touchUpInside)
        endEditButton.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView!)
        }
        
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
        //formView?.backgroundColor = UIColor.yellow
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
        textField?.placeholder = "您的手机号码"
        textField?.font = UIFont.systemFont(ofSize:15)
        textField?.delegate = self
        textField?.isUserInteractionEnabled = true
        textField?.keyboardType = UIKeyboardType.numberPad
        textField?.clearButtonMode = .whileEditing
        formView?.addSubview(textField!)
        textField?.addTarget(self, action: #selector(textFieldDidChanged(sender:)), for: .editingChanged)
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
        tipView?.backgroundColor = UIColor.red
        formView?.addSubview(tipView!)
        tipView?.snp.makeConstraints({ (make) in
            make.top.equalTo(centerLabel.snp.bottom)
            make.leading.trailing.equalTo(formView!)
            //self.heightConstraint!.constant = 0
            make.height.equalTo(0)
        })
        
        formView?.snp.makeConstraints({ (make) in
            make.bottom.equalTo(tipView!)
        })
        
        nextButton = UIButton()
        nextButton?.setTitle("下一步", for: .normal)
        nextButton?.backgroundColor = UIColor.orange
        nextButton?.addTarget(self, action: #selector(endEdit), for: .touchUpInside)
        contentView?.addSubview(nextButton!)
        nextButton!.snp.makeConstraints { (make) in
            make.top.equalTo(formView!.snp.bottom).offset(20)
            make.leading.equalTo(self.view).offset(17)
            make.trailing.equalTo(self.view).offset(-17)
            make.height.equalTo(40)
        }
    }
    
    @objc func textFieldDidChanged(sender : UITextField) {
        let text : String = sender.text!
        var tipViewText = text
        if text.count > 0 {
            if text.count < 4 {
                tipViewText = text
               tipView?.label?.text = tipViewText
            }
            else if text.count > 3 && text.count < 8{
                tipViewText = text
                tipViewText.insert(" ", at: text.index(text.startIndex, offsetBy: 3))
                tipView?.label?.text = tipViewText
            }else if text.count > 7  {
                tipViewText = text
                tipViewText.insert(" ", at: text.index(text.startIndex, offsetBy: 3))
                tipViewText.insert(" ", at: text.index(text.startIndex, offsetBy: 8))
                tipView?.label?.text = tipViewText
            }
            if text.count > 11 {
                let indexs = text.index(text.startIndex, offsetBy: 11)
                let str = String(text[..<indexs])
                tipViewText = str
                tipViewText.insert(" ", at: text.index(text.startIndex, offsetBy: 3))
                tipViewText.insert(" ", at: text.index(text.startIndex, offsetBy: 8))
                sender.text = str
                tipView?.label?.text = tipViewText
            }
            updateTipViewConstraints()

        }else{
            hideTipView()
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let text : String = textField.text!
        if text.count > 0 {
            tipView?.label?.text = textField.text
            updateTipViewConstraints()
        }
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        hideTipView()
        return true
    }
    
    func updateTipViewConstraints() {
        tipView?.snp.updateConstraints({ (make) in
            make.height.equalTo(50)
        })
        tipView?.label!.backgroundColor = UIColor.clear
        self.view.needsUpdateConstraints()
        UIView.animate(withDuration: 0.3) {
            self.view.updateConstraintsIfNeeded()
            self.view.layoutIfNeeded()
        }
    }
    
    //隐藏tipview
    func hideTipView() {
        print("hideTipView")
        tipView?.label?.text = ""
        tipView?.snp.updateConstraints({ (make) in
                make.height.equalTo(0)
        })
        self.view.needsUpdateConstraints()
        UIView.animate(withDuration: 0.3) {
            self.view.updateConstraintsIfNeeded()
            self.view.layoutIfNeeded()
        }
    }
    
   @objc  func endEdit() {
        self.view.endEditing(true)
    }
    
}
