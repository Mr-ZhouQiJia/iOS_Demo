//
//  ZXSpecialCycleScrollView.swift
//  DDSC_Swift
//
//  Created by ddsc on 2018/12/18.
//  Copyright © 2018 ddsc. All rights reserved.
//

import UIKit



class ZXSpecialCycleScrollView: UIView,UIScrollViewDelegate {
    typealias ClickCycleScrollView = (_ index : Int) -> Void
    /**
     数据源
     */
    private var  _records : Array<Any>?
    var records : Array<Any> {
        set {
            _records  = newValue
            
        }
        get{
            return _records!
        }
    }
    
    /**
     两个item之间的间距
     */
    var itemSpace : Float?
    
    /**
     图片高度缩放大小
     */
    var itemScaleHeight : Float?
    
    /**
     ScrollView的大小,自动居中
     */
    private var myScrollViewSize : CGSize!
    var scrollViewSize : CGSize {
        set {
            myScrollViewSize = newValue
            self.changeFrame()
        }
        get {
            return myScrollViewSize
        }
    }
    
    /**
     是否循环滚动,默认开启
     */
    var autoScroll : Bool?
    
    /**
     滚动时间间隔
     */
    var timeInterval : CGFloat?
    
    /**
     点击事件回调
     */
    var didClickViewIndex : ClickCycleScrollView?
    
    var scrollView : UIScrollView?
    var kItemWidth : CGFloat?
    var kItemHeight : CGFloat?
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        self.configUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        scrollView = UIScrollView()
        self.scrollView?.clipsToBounds = false
        self.scrollView?.isScrollEnabled = true
        self.scrollView?.delegate = self
        self.scrollView?.showsHorizontalScrollIndicator = false
        self.addSubview(self.scrollView!)
        self.scrollView?.backgroundColor = UIColor.red
        
        
       
        
//        for (index,image) in records.enumerated() {
//            let imageV =  UIImageView.init(image: UIImage(named: image as! String))
//            imageV.frame = CGRect(x: kItemWidth! * CGFloat(index), y: 0, width: kItemWidth!, height: kItemHeight!)
//
//        }
        
       
    }
    
    func changeFrame() {
        
        scrollView?.frame = CGRect.init(x: ZX_WIDTH/2, y: (self.bounds.size.height - self.scrollViewSize.height/2), width:self.scrollViewSize.width, height: self.scrollViewSize.height)
        kItemWidth = self.scrollView?.frame.size.width
        kItemHeight = self.scrollView?.frame.size.height
        self.scrollView?.contentSize = CGSize.init(width: kItemWidth! * 3, height: kItemHeight!)
        self.scrollView?.contentOffset = CGPoint.init(x: 2 * kItemWidth!, y: 0)
        
        for index in 0..<3 {
            let imageV =  UIImageView.init(image: UIImage(named: "Rectangle 17" ))
            imageV.frame = CGRect.init(x:CGFloat(index) * kItemWidth!, y: 0, width: kItemWidth!, height: kItemHeight!)
            self.scrollView?.addSubview(imageV)
        }
    }
   
}



class AIImageView: UIImageView {
    
    
    
    
    
    
    
}







