//
//  Swift_Expand.swift
//  Swift_Basic
//
//  Created by ddsc on 2019/4/30.
//  Copyright © 2019 ddsc. All rights reserved.
//

import UIKit

class Swift_Expand: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView : UITableView?
    var dataSource : Array<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Demo"
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: Device_Width, height: Device_Height), style: .plain)
        self.view.addSubview(tableView!)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        dataSource = ["悬浮球和进度条"]
        tableView?.tableFooterView = UIView()
    }
    
    //MARK: UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataSource?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel?.text = dataSource![indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
           let vc =  SuspensionProgressDemo()
            self.navigationController?.pushViewController(vc, animated: true)
        default: break
            
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
