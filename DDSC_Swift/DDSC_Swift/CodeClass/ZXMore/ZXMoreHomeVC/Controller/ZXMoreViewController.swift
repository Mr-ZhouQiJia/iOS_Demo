//
//  ZXMoreViewController.swift
//  DDSC_Swift
//
//  Created by ddsc on 2018/11/29.
//  Copyright © 2018 ddsc. All rights reserved.
//

import UIKit
import Alamofire
class ZXMoreViewController: BaseViewController , UITableViewDelegate,UITableViewDataSource {
    var tableView : UITableView?
    let kPageNewsSize = "20"
    
    func requestData() {
        
        let params = ["confKey":"DISCOVER_HEAD",
                      "packetName":kDDPacketName,
                      "requestPage":"1",
                      "pageSize":kPageNewsSize]
        
        ZXNetworkingManager.sharedNetworkManager.getRequest(url: "page/findpage/gateway-nonessential-c", params: params, success: { (data) in
            print(data)
        }) { (error) in
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buildNavi()
        self.buildTableView()
        self.requestData()
        self.jz_navigationBarBackgroundAlpha = 0.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + 1 + 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 140
        case 1:
            return 150
        default:
            return 90
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! ZXMoreHomeHeadersCell
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as! ZXMoreHomeSecondCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! ZXMoreHomeNewsCell
            
            return cell
        }
        
    }
    
}
extension ZXMoreViewController{
    func buildNavi() {
        self.title = "发现"
        navigationController?.navigationBar.tintColor = UIColor.red
        let leftButton = UIButton(type: .custom)
        leftButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        leftButton.setImage(UIImage(named: "icon_nav_mycount_setting_nor"), for: .normal)
        leftButton.addTarget(self, action: #selector(clickSettingButton), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        let rightButton = UIButton(type: .custom)
        rightButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        rightButton.setImage(UIImage(named: "icon_kefu"), for: .normal)
        rightButton.addTarget(self, action: #selector(clickKeFuButton), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        
    }
    @objc func clickSettingButton() {
        print("设置")
    }
    @objc func clickKeFuButton() {
        print("客服")
    }
    
    func buildTableView() {
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: ZZX_WIDTH, height: ZZX_HEIGHT), style: .plain)
        self.view.addSubview(self.tableView!)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.register(ZXMoreHomeNewsCell.classForCoder() , forCellReuseIdentifier: "newsCell")
        self.tableView?.register(ZXMoreHomeHeadersCell.classForCoder(), forCellReuseIdentifier: "headerCell")
        self.tableView?.register(ZXMoreHomeSecondCell.classForCoder(), forCellReuseIdentifier: "secondCell")
    }
    
    
}
