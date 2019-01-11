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
import Reachability
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
    
    var reachAbility : Reachability!
    
    var isNeedAccessToken : Bool = true //是否拼接在url后面的参数
    var baseParams : NSMutableDictionary = [:] //公共参数
    
    var headers : HTTPHeaders?
    
    
    static let  sharedNetworkManager = ZXNetworkingManager()
    let manager = SessionManager.default
    private override init() {
        super.init()
        judgeNetwork(network: currentNetwork)
        
    }
    
    
   // private var manager : Alamofire
    
//    private var sessionManager : Alamofire.SessionManager = {
//
//    }();
    //MARK: 监听网络状态
    func monitorReachAbility() {
        reachAbility = Reachability.init()
        if reachAbility!.connection == .none {
            print("网络连接失败")
            SVProgressHUD.showInfo(withStatus:"网络连接失败")
            return
        }else if reachAbility!.connection == .wifi {
            print("WIFI网络")
            SVProgressHUD.showInfo(withStatus:"WIFI网络")
            //return
        }else if reachAbility!.connection == .cellular{
            print("数据网络")
            SVProgressHUD.showInfo(withStatus: "数据网络")
        }
        
    }
    
    func getRequest(url : String , params : [String : Any]?, success: @escaping(_ responseObject : [String : AnyObject]) -> ()  ,faliure:  @escaping(_ error : Error) -> ()) {
        print( NetworkReachabilityManager.NetworkReachabilityStatus.self)
        self.monitorReachAbility()
        var cookieString = ZXUtils.fetchFromUserDefaultsWithKey(key:USER_COOKIE_KEY)
        
       // headers = ["Cookie":cookieString,
        //           "Content-Type":"application/json;charset=utf-8"] as! HTTPHeaders
        Alamofire.request(self.getCompleteUrl(url: url), method: HTTPMethod.get, parameters: params, encoding: URLEncoding.httpBody, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let value) :
                success(value as! [String : AnyObject])
            case .failure(let error):
                faliure(error)
            }
        }
    }
    
    func postRequest(url: String , params : [String:Any]?, success: @escaping(_ responObject : [String : AnyObject]) -> () , faliure : @escaping(_ error : Error) -> ()) {
        self.monitorReachAbility()
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.httpBody, headers: nil).responseJSON { (response) in
            switch response.result{
            case .success(let value) :
                success(value as! [String : AnyObject])
            case .failure(let error):
                faliure(error)
            }
        }
    }
    
    //MARK: 拼接完整的url
    func getCompleteUrl(url : String) -> String{
        let newUrl = ZXNewAPIBaseURLString.appending(url)
        if self.isNeedAccessToken {
            //拼接AccessToken
        }
        return newUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    }
    
    //MARK: 拼接完整参数
    func CombinationParams(params: NSDictionary) -> [String : Any] {
        self.baseParams.addEntries(from: params as! [AnyHashable : Any])
        return self.baseParams as! [String : Any]
    }
    
    
    
}
