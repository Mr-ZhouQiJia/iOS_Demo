//
//  ZXMyAccountLeftVC.swift
//  DDSC_Swift
//
//  Created by ddsc on 2019/1/9.
//  Copyright © 2019 ddsc. All rights reserved.
//

import UIKit

let kHeaderHeight : CGFloat = 240.0
let kHeaderHeight_iPhoneX : CGFloat = 264.0



class ZXMyAccountLeftVC: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView : UITableView?
    var cellData  : Array<NSDictionary>?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.color(hexString: "e1e6e9")
        buildTableView()
        cellData = [["title" : "银行卡","imageName" : "icon_mycount_setting_card"],
                    ["title" : "密码设置","imageName": "icon_mycount_setting_key"],
                    ["title" : "地址管理", "imageName" : "icon_gerenzhongxin_dizhiguanli"],
                    ["title" : "退出账号", "imageName" : "icon_mycount_setting_exit"]]
    }
    
    
    
}

extension ZXMyAccountLeftVC{
    
    func buildTableView() {
        self.tableView = UITableView(frame: CGRect(x: 0, y: -44, width: ZX_WIDTH * 0.8, height: ZZX_HEIGHT + 44), style: .plain)
        self.tableView?.isScrollEnabled = false
        self.tableView?.backgroundColor = UIColor.color(hexString: "e1e6e9")
        self.view.addSubview(self.tableView!)
        self.tableView?.register(UINib.init(nibName: "ZXMyAccountLeftCell", bundle: nil), forCellReuseIdentifier: "ZXMyAccountLeftCell")
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        let headerView = Bundle.main.loadNibNamed("MyAccountLeftHeaderView", owner: nil, options: nil)?.last
        self.tableView?.tableHeaderView = headerView as? UIView
        
        let footerView = Bundle.main.loadNibNamed("ZXMyAccountLeftFooterView", owner: nil, options: nil)?.last
        self.tableView?.tableFooterView = footerView as? UIView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ZXMyAccountLeftCell = tableView.dequeueReusableCell(withIdentifier: "ZXMyAccountLeftCell", for: indexPath) as! ZXMyAccountLeftCell
        let dic : NSDictionary = cellData![indexPath.row]
        cell.titleLB.text = (dic["title"] as! String)
        cell.imageV.image = UIImage(named: dic["imageName"] as! String)
        if indexPath.row == 0 {
            cell.bankLB.isHidden = false
            cell.bankLB.text = "中国农业银行271"
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
    
}

