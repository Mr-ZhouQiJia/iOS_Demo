//
//  SuspensionProgressDemo.swift
//  Swift_Basic
//
//  Created by ddsc on 2019/5/6.
//  Copyright © 2019 ddsc. All rights reserved.
//

import UIKit

class SuspensionProgressDemo: BaseViewController {
    var waveProgressView : WaveProgressView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildWaveView()
    }
    
    func buildWaveView() {
        let backView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        backView.backgroundColor = UIColor.red
        backView.layer.cornerRadius = backView.frame.size.width / 2.0
        backView.layer.masksToBounds = true
        backView.center = self.view.center
        self.view.addSubview(backView)
        
        waveProgressView = WaveProgressView(frame: CGRect(x: 0, y: 0, width: 160, height: 160))
        waveProgressView?.center = backView.center
        backView.addSubview(waveProgressView!)
    }

}
