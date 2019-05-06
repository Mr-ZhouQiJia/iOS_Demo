//
//  Swift_BasicVC.swift
//  Swift_Basic
//
//  Created by ddsc on 2019/4/30.
//  Copyright © 2019 ddsc. All rights reserved.
//

import UIKit

class Swift_BasicVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView : UITableView?
    var dataSource : Array<Any>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Swift基础"
        self.view.backgroundColor = UIColor.white
        buildTable()
        
    }
    
    func buildTable() {
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: Device_Width, height: Device_Height), style: .plain)
        dataSource = ["基础类型","基础运算符"]
        self.view.addSubview(self.tableView!)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView?.tableFooterView = UIView()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataSource?.count)!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataSource![indexPath.row] as! String)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webview = WebViewController()
        self.navigationController?.pushViewController(webview, animated: true)
    }
    
}
