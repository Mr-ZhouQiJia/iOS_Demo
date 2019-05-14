//
//  WaveProgressView.swift
//  Swift_Basic
//
//  Created by ddsc on 2019/5/7.
//  Copyright © 2019 ddsc. All rights reserved.
//

import UIKit

class WaveProgressView: BaseView {
    /**
     进度 0~1
     */
    var progress : CGFloat?
    /**
     文字字体
     */
    var textFont : UIFont?
    /**
     波浪背景颜色
     */
    var waveBackgroundColor : UIColor?
    /**
     波浪颜色
     */
    var waveColor : UIColor?
    var wave : Wave?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildUI(){
        wave = Wave(frame: self.frame)
        wave?.center = CGPoint.init(x: self.bounds.width / 2.0, y: self.bounds.height / 2.0)
        self.addSubview(wave!)
    }
    
    
}

class Wave: UIView {
    /**
     进度 0~1
     */
    var progress : CGFloat?
    /**
     文字字体
     */
    var textFont : UIFont?
    /**
     波浪背景颜色
     */
    var waveBackgroundColor : UIColor?
    /**
     波浪颜色
     */
    var waveColor : UIColor?
    
    /**
     后面的波浪
     */
    var backWaveLayer : CAShapeLayer?
    /**
     前面的波浪
     */
    var frontWaveLayer : CAShapeLayer?
    /**
     定时器
     */
    var displayLink : CADisplayLink?
    /**
     曲线的振幅
     */
    var waveAmplitude : CGFloat?
    /**
     曲线的角速度
     */
    var wavePalstance : Double?
    /**
     曲线初相
     */
    var waveX : CGFloat?
    /**
     曲线偏距
     */
    var waveY : CGFloat?
    /**
     曲线移动速度
     */
    var waveMoveSpeed : CGFloat?
    /**
     底层进度值
     */
    var progressLabel1 : UILabel?
    /**
     中层进度值
     */
    var progressLabel2 : UILabel?
    /**
     上层进度值
     */
    var progressLabel3 : UILabel?
    
    var currentProgress : CGFloat?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildUI()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildUI() {
        self.backgroundColor = UIColor.white
        //初始化波浪
        //底层
        backWaveLayer = CAShapeLayer()
        self.layer.addSublayer(backWaveLayer!)
        //上层
        frontWaveLayer = CAShapeLayer()
        self.layer.addSublayer(frontWaveLayer!)
        //画圆
        self.layer.cornerRadius = self.bounds.size.width/2
        self.layer.masksToBounds = true
        
        //底部白底红字
        progressLabel1 = UILabel(frame: self.bounds)
        progressLabel1?.textAlignment = NSTextAlignment.center
        progressLabel1?.backgroundColor = UIColor.white
        progressLabel1?.textColor = UIColor.red
        self.addSubview(progressLabel1!)
        
        //下部白底红字
        progressLabel2 = UILabel(frame: self.bounds)
        progressLabel2?.textAlignment = NSTextAlignment.center
        progressLabel2?.backgroundColor = UIColor.white
        progressLabel2?.textColor = UIColor.white
        self.addSubview(progressLabel2!)
        
        //上部白底红字
        progressLabel3 = UILabel(frame: self.bounds)
        progressLabel3?.textAlignment = NSTextAlignment.center
        progressLabel3?.backgroundColor = UIColor.white
        progressLabel3?.textColor = UIColor.red
        self.addSubview(progressLabel3!)
        self.currentProgress = 0.0
    }
    
    //初始化数据
    func configWave() {
        //振幅
        waveAmplitude = self.bounds.size.width / 20
        //角速度
        wavePalstance = Double.pi / Double(self.bounds.size.width)
        //偏距
        waveX = self.bounds.size.width
        //初相
        waveY = 0
        //X轴移动速度
        waveMoveSpeed = CGFloat(wavePalstance!) * (self.bounds.size.width / 40)
    }
    
    func updateWave(link : CADisplayLink) {
        waveX = waveX! + waveMoveSpeed!
        updateWave1()
        updateWave2()
        updateWaveY()
        updateProgress()
    }
    
    func updateWaveY() {
        
    }
    
    func updateWave1() {
        
    }
    
    func updateWave2() {
        
    }
    
    func updateProgress() {
        
    }
}
