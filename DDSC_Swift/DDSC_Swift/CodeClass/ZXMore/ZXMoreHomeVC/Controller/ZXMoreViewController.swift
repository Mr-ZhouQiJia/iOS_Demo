//
//  ZXMoreViewController.swift
//  DDSC_Swift
//
//  Created by ddsc on 2018/11/29.
//  Copyright © 2018 ddsc. All rights reserved.
//

import UIKit

class ZXMoreViewController: BaseViewController , UITableViewDelegate,UITableViewDataSource {
    var tableView : UITableView?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buildNavi()
        self.buildTableView()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath)
        return cell
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
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: ZX_WIDTH, height: ZZX_HEIGHT), style: .grouped)
        self.view.addSubview(self.tableView!)
        self.tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "newsCell")
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
    }
    
    
}
