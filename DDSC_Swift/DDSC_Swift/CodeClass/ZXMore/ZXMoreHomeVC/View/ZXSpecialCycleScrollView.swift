//
//  ZXSpecialCycleScrollView.swift
//  DDSC_Swift
//
//  Created by ddsc on 2018/12/18.
//  Copyright © 2018 ddsc. All rights reserved.
//

import UIKit
class ZXSpecialCycleScrollView: UIView{
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
            addTimer()
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
    
    /**
     计时器
     */
    var timer : Timer?
    
    var scrollView : UIScrollView?
    var kItemWidth : CGFloat?
    var kItemHeight : CGFloat?
    
    /**
     图片下标
     */
    var currentIndex  = 0
    
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
        self.scrollView?.isPagingEnabled = true
        self.scrollView?.delegate = self
        self.scrollView?.showsHorizontalScrollIndicator = false
        self.addSubview(self.scrollView!)
       // self.scrollView?.backgroundColor = UIColor.red
        
    }
    
    func changeFrame() {
        scrollView?.frame = CGRect.init(x:(self.bounds.size.width -  scrollViewSize.width)/2.0, y: (self.bounds.size.height - self.scrollViewSize.height)/2.0, width:self.scrollViewSize.width, height: self.scrollViewSize.height)
        kItemWidth = self.scrollView?.frame.size.width
        kItemHeight = self.scrollView?.frame.size.height
        self.scrollView?.contentSize = CGSize.init(width: kItemWidth! * 3, height: kItemHeight!)
        self.scrollView?.contentOffset = CGPoint.init(x: 1 * kItemWidth!, y: 0)
        
        let imageV1 =  UIImageView()
        imageV1.frame = CGRect.init(x:20.5, y: 5.5, width: kItemWidth! * 0.8, height: kItemHeight! * 0.8)
        imageV1.kf.setImage(with: URL(string: records.last as! String))
       // imageV1.contentMode = UIView.ContentMode.center
        scrollView?.addSubview(imageV1)
        
        let imageV2 =  UIImageView()
        imageV2.frame = CGRect.init(x:kItemWidth!, y: 0, width: kItemWidth!, height: kItemHeight!)
        imageV2.kf.setImage(with: URL(string: records[0] as! String))
        scrollView?.addSubview(imageV2)
        
        let imageV3 =  UIImageView()
        imageV3.frame = CGRect.init(x:kItemWidth! * 2 + 20.5, y: 5.5, width: kItemWidth! * 0.8, height: kItemHeight! * 0.8)
        imageV3.kf.setImage(with: URL(string: records[1] as! String))
        scrollView?.addSubview(imageV3)
    }
    
    func addTimer() {
       
        if #available(iOS 10.0, *) {
            timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { (timer) in
                self.nextPage()
                
            })
        } else {
            // Fallback on earlier versions
        }
        RunLoop.current.add(timer!, forMode: .common)
    }
   
    func nextPage() {
        let contentOffset = CGPoint(x: kItemWidth! * 2, y: 0)
        if currentIndex < records.count - 1 {
          currentIndex += 1
        } else {
            currentIndex = 0
        }
        
        scrollView?.setContentOffset(contentOffset, animated: true)
    }
    
    func prePage() {
        let contentOffset = CGPoint(x: 0 , y: 0)
        scrollView?.setContentOffset(contentOffset, animated: true)
    }
    
    func reloadImage() {
        print(currentIndex)
        let nextIndex = (Int(currentIndex) + 1) % records.count
        let preIndex  = (Int(currentIndex) + 3) % records.count
        (scrollView?.subviews[0] as! UIImageView).kf.setImage(with: URL(string: records[preIndex] as! String))
        (scrollView?.subviews[1] as! UIImageView).kf.setImage(with: URL(string: records[Int(currentIndex)] as! String))
        (scrollView?.subviews[2] as! UIImageView).kf.setImage(with: URL(string: records[nextIndex] as! String))
    }
    
    func removeTimer(){
        timer?.invalidate()
        timer = nil
    }
}

extension ZXSpecialCycleScrollView : UIScrollViewDelegate {
   
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTimer()
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        reloadImage()
        scrollView.setContentOffset(CGPoint(x: kItemWidth! , y: 0), animated: false)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
        if scrollView.contentOffset.x < kItemWidth! {
            prePage()
        } else {
            nextPage()
        }
    }
}

class AIImageView: UIImageView {
    
    
    
    
    
    
    
}







