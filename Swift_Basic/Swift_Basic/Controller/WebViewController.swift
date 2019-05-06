//
//  WebViewController.swift
//  Swift_Basic
//
//  Created by ddsc on 2019/4/30.
//  Copyright © 2019 ddsc. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController {
    var webView : WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: Device_Width, height: Device_Height))
        let url = URL(string: "www.baidu.com")
        webView?.load(URLRequest(url: url!))
        self.view.addSubview(webView!)
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
