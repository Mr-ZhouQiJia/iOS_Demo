//
//  ZX_ListVC.swift
//  ZX_GunDongTiShi
//
//  Created by ddsc on 2018/11/21.
//  Copyright © 2018 ddsc. All rights reserved.
//

import UIKit

let WIDTH = UIScreen.main.bounds.size.width
let HEIGHT = UIScreen.main.bounds.size.height



class ZX_ListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView : UITableView?
    
    var dataSource = ["上下滚动","左右滚动"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List "
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT), style: .plain)
        self.view.addSubview(tableView!)
        self.tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.tableFooterView = UIView.init()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let topVC = TopVC.init()
            
            self.navigationController?.pushViewController(topVC, animated: true)
        }else {
            let leftVC = LeftVC.init()
            
            self.navigationController?.pushViewController(leftVC, animated: true)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
