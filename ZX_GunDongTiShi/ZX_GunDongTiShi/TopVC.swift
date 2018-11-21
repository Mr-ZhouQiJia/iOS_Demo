//
//  TopVC.swift
//  ZX_GunDongTiShi
//
//  Created by ddsc on 2018/11/21.
//  Copyright © 2018 ddsc. All rights reserved.
//

import UIKit

class TopVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView   : UITableView?
    var backView    : UIView?
    var startButton : UIButton?
    var turnButton  : UIButton?
    
    
    var dataSource = ["1","2","3","4","5","6","7"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        backView = UIView.init(frame: CGRect(x: 0, y: 200, width: WIDTH, height: 150))
        backView?.backgroundColor = UIColor.purple
        self.view.addSubview(backView!)
        // backView?.isUserInteractionEnabled = true
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: WIDTH, height: 150), style: .plain)
        backView?.addSubview(tableView!)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        startButton = UIButton(type: .custom)
        startButton?.frame = CGRect(x: 80, y: 400, width: 100, height: 40)
        startButton?.setTitle("启动", for: .normal)
        startButton?.backgroundColor = UIColor.red
        startButton?.addTarget(self, action: #selector(start), for: UIControl.Event.touchUpInside)
        self.view.addSubview(startButton!)
    }
    
    @objc func start() {
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.tableView?.scrollToRow(at: IndexPath(row: 5, section: 0), at: UITableView.ScrollPosition.bottom, animated: true)
            
        }
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
