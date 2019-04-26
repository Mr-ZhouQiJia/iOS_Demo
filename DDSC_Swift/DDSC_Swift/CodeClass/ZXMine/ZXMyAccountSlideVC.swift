//
//  ZXMyAccountSlideVC.swift
//  DDSC_Swift
//
//  Created by ddsc on 2019/1/9.
//  Copyright © 2019 ddsc. All rights reserved.
//

import UIKit

let kSlideWidth : CGFloat = UIScreen.main.bounds.size.width * 0.8
let Distance : CGFloat = 80.0
let Duration : CGFloat = 0.3
let scale    : CGFloat = (ZZX_WIDTH * 0.8 - Distance) / (ZZX_WIDTH * 0.8)
class ZXMyAccountSlideVC: BaseViewController {

    var myAccountMainVC : ZXMineViewController?
    var myAccountLeftVC : ZXMyAccountLeftVC?
    var totalPanGesture : UIPanGestureRecognizer?
    var mainNavi        : UINavigationController?
    var mainButton      : UIButton?
    var tabMainButton   : UIButton?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMyAccountMainVC()
        addMyAccountLeftVC()
        self.view.sendSubviewToBack(self.myAccountLeftVC!.view)

        self.navigationController?.navigationBar.isHidden = true
        addGesture()
    }
    
    
    
    

}

extension ZXMyAccountSlideVC : UIGestureRecognizerDelegate {
    //添加主页面
    func addMyAccountMainVC() {
        self.myAccountMainVC = ZXMineViewController()
        self.mainNavi = UINavigationController(rootViewController: self.myAccountMainVC!)
        self.myAccountMainVC?.jz_navigationBarBackgroundAlpha = 0.0
        self.addChild(self.mainNavi!)
        self.view.addSubview(self.mainNavi!.view)
    }
    
    //添加左侧视图
    func addMyAccountLeftVC() {
        self.myAccountLeftVC = ZXMyAccountLeftVC()
        self.myAccountLeftVC?.view.frame = CGRect(x: -kSlideWidth + Distance, y: 0, width: kSlideWidth, height: ZZX_HEIGHT)
        self.addChild(self.myAccountLeftVC!)
        self.view.addSubview(self.myAccountLeftVC!.view)
    }
    
    //MARK: gesture
    func addGesture() {
        let panGesture : UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.panGesterHandle(sender:)))
        panGesture.delegate = self
        self.view.addGestureRecognizer(panGesture)
    }
    
    @objc func panGesterHandle(sender : UIPanGestureRecognizer) {
        let mainView = self.mainNavi?.view
        let leftView = self.myAccountLeftVC?.view
        
        let x = sender.translation(in: self.view).x              //获取手指在屏幕上X轴的移动距离
        sender.setTranslation(CGPoint.zero, in: self.view)       //重置手势的位置
        
        var rightSlide : Bool = false
        let xSpeed = sender.velocity(in: self.view).x            // 在横轴的滑动速度, <大于0是向右,小于0向左>
        print(xSpeed)
       
        if xSpeed > 0 {
            rightSlide = true
        } else {
            rightSlide = false
        }
        if rightSlide && mainView!.x() >= kSlideWidth {
            self.finalPositionWithRightSlide(rightSlide: rightSlide, mainView: mainView!, leftView: leftView!)
            return
        }
        if !rightSlide && mainView!.x() <= 0 {
            self.finalPositionWithRightSlide(rightSlide: rightSlide, mainView: mainView!, leftView: leftView!)
            return
        }
        self.animationWithOffset(offsetX: x, mainView: mainView!, leftView: leftView!)
        if sender.state == UIGestureRecognizer.State.ended {
            self.finalPositionWithRightSlide(rightSlide: rightSlide, mainView: mainView!, leftView: leftView!)
        }
    }
    
    func animationWithOffset(offsetX :CGFloat , mainView : UIView , leftView : UIView ) {
        if offsetX < 0 && mainView.x() == 0 {
            return
        }
        
        mainView.frame.origin.x += offsetX
        leftView.frame.origin.x += offsetX * scale
        self.tabBarController?.tabBar.frame.origin.x += offsetX
        
        if mainView.x() >= kSlideWidth {
            self.showLeftView()
            return
        }
        
    }
    
    //
    func finalPositionWithRightSlide(rightSlide : Bool, mainView : UIView,leftView : UIView) {
        if rightSlide && mainView.x() > ZZX_WIDTH * 0.2 {
            showLeftView()
        } else if !rightSlide && mainView.x() > ZZX_WIDTH * 0.7 {
            showLeftView()
        }else {
            showMainView()
        }
    }
    
    //
    func showLeftView() {
        UIView.animate(withDuration: TimeInterval(Duration)) {
            self.mainNavi!.view.frame.origin.x = kSlideWidth
            self.myAccountLeftVC!.view.frame.origin.x = 0
            self.tabBarController?.tabBar.frame.origin.x = kSlideWidth
            if !(self.totalPanGesture != nil) || !(self.myAccountMainVC != nil) || !(self.myAccountLeftVC != nil) {
                self.addBackButton()
            }
        }
    }

    //
    @objc func showMainView() {
        UIView.animate(withDuration: TimeInterval(Duration)) {
            self.mainNavi?.view.frame.origin.x = 0
            self.myAccountLeftVC?.view.frame.origin.x = -kSlideWidth + Distance
            self.tabBarController?.tabBar.frame.origin.x = 0
            if (self.mainButton != nil) || self.tabMainButton != nil || self.totalPanGesture != nil {
                self.view.removeGestureRecognizer(self.totalPanGesture!)
                self.mainButton?.removeFromSuperview()
                self.tabMainButton?.removeFromSuperview()
                self.totalPanGesture = nil
                self.mainButton = nil
                self.tabMainButton = nil
            }
        }
    }
    
    //MARK: 添加全屏返回按钮
    func addBackButton() {
        self.mainButton = UIButton.init(frame:CGRect(x: 0, y: 0, width:ZZX_WIDTH, height: ZZX_HEIGHT))
        self.mainButton?.addTarget(self, action: #selector(showMainView), for: .touchUpInside)
        self.myAccountMainVC?.navigationController?.view.addSubview(self.mainButton!)
        
        self.tabMainButton = UIButton(frame: CGRect(x: 0, y: 0, width:ZZX_WIDTH, height: 100))
        self.tabMainButton?.addTarget(self, action: #selector(showMainView), for: .touchUpInside)
        self.tabBarController?.tabBar.addSubview(self.tabMainButton!)
        
        self.totalPanGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesterHandle(sender:)))
        self.view.addGestureRecognizer(self.totalPanGesture!)
    }
    
    
    //MARK: UIGestureRecognizerDelegate
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if self.mainNavi!.topViewController!.isKind(of: ZXMineViewController.classForCoder()) {
            let x = gestureRecognizer.location(in: self.view).x
            print(x)
            if x <= ZZX_WIDTH * 0.2 {
                print("begin")
                 return true
            }else {
                print("notBegin")
                return false
            }
            return true
        }
        return false
    }
}
