//
//  MacroDocument.swift
//  DDSC_Swift
//
//  Created by ddsc on 2018/11/28.
//  Copyright © 2018 ddsc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Alamofire
import SwiftyJSON
import Kingfisher


let ZZX_WIDTH : CGFloat = UIScreen.main.bounds.size.width
let ZZX_HEIGHT : CGFloat = UIScreen.main.bounds.size.height

let kDDPacketName = "ddsoucai"
let USER_COOKIE_KEY = "userCookieKey"   //用户cookie

let IS_iPhoneX : Bool = ZZX_HEIGHT >= 812.0 ? true : false
let IS_iPhone4 : Bool = ZZX_HEIGHT < 568 ? true : false
let IS_iPhone5 : Bool = ZZX_HEIGHT == 568 ? true : false
let IS_iPhone6p : Bool = ZZX_HEIGHT == 736 ? true : false


let ZX_NaviBarHeight : CGFloat = IS_iPhoneX ? 88 : 64

let ZX_TextColor = UIColor.color(hexString: "888888")
























