//
//  ZXNetworkingManager.swift
//  DDSC_Swift
//
//  Created by ddsc on 2018/12/4.
//  Copyright © 2018 ddsc. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
//1.定义枚举,配置网络环境
enum NetworkEnviroment {
    case Development
    case Test
    case Distribution
}

//2.定义多个私有属性,来存储不同的服务地址
private var ZXNewAPIBaseURLString = ""
private var ZXNewAPIBaseH5URLString = ""

//3.根据设置的开发环境不同,服务地址发生改变
let currentNetwork : NetworkEnviroment = .Test
private func judgeNetwork(network: NetworkEnviroment = currentNetwork){
    if network == .Distribution {
        ZXNewAPIBaseURLString = "https://gwserv.ddsoucai.com/ddsc-app/"
        ZXNewAPIBaseH5URLString = "https://gwserv.ddsoucai.com/ddsc-html/"
    } else if network == .Test {
        ZXNewAPIBaseURLString = "http://192.168.3.193/ddsc-app/"
        ZXNewAPIBaseH5URLString = "http://192.168.3.193:3334/ddsc-html/"
    } else {
        ZXNewAPIBaseURLString = "http://192.168.3.194:3334/ddsc-app/"
        ZXNewAPIBaseH5URLString = "http://192.168.3.194:3334/ddsc-html/"
    }
    
    
}

class ZXNetworkingManager: NSObject {
    static let  sharedNetworkManager = ZXNetworkingManager()
    let manager = SessionManager.default
    private override init() {
        
    }
    
    
   // private var manager : Alamofire
    
//    private var sessionManager : Alamofire.SessionManager = {
//
//    }();
    
    //判断网络连接
    func getNetworkStatus() {
        let manager = NetworkReachabilityManager()
        manager?.listener = { status in
            switch status {
            case .notReachable:
                SVProgressHUD.showInfo(withStatus: "网络连接失败,请检查网络")
                print("网络连接失败")
            case .reachable(.ethernetOrWiFi):
                SVProgressHUD.showInfo(withStatus: "WIFI网络")
                print("WIFI网络")
            case .reachable(.wwan):
                print("蜂窝网络")
            default: break
                
            }
        }
        manager?.startListening()
    }
    
    func getRequest(url : String , params : [String : Any]?, success: @escaping(_ responseObject : [String : AnyObject]) -> ()  ,faliure:  @escaping(_ error : Error) -> ()) {
        let headers : HTTPHeaders = ["Content-Type":"application/json;charset=utf-8"];
        self.getNetworkStatus()
        print( NetworkReachabilityManager.NetworkReachabilityStatus.self)
        Alamofire.request(url, method: HTTPMethod.get, parameters: params, encoding: URLEncoding.httpBody, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let value) :
                success(value as! [String : AnyObject])
            case .failure(let error):
                faliure(error )
                
            }
        }
    }

}
