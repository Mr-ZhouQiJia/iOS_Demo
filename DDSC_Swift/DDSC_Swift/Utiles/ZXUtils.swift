//
//  ZXUtils.swift
//  DDSC_Swift
//
//  Created by ddsc on 2019/1/8.
//  Copyright © 2019 ddsc. All rights reserved.
//

import UIKit

class ZXUtils: NSObject {
   
    //MARK: 数据持久化
    //存
    class func writeToUserDefaultsWithKey(key : String , value : AnyObject) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    //取
    class func fetchFromUserDefaultsWithKey(key : String) -> AnyObject{
        return UserDefaults.standard.value(forKey:key) as AnyObject 
    }
    
    //删除
    func removeUserDefaultsWithKey(key : String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
