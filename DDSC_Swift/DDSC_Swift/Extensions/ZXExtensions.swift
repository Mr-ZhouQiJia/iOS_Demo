//
//  ZXExtensions.swift
//  DDSC_Swift
//
//  Created by ddsc on 2018/11/29.
//  Copyright © 2018 ddsc. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    public class func color(hexString: String, alpha: CGFloat? = 1.0) -> UIColor {
        
        var cString = hexString.trimmingCharacters(in:.whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            //            cString = cString[(from: cString.index(after: cString.startIndex))
            cString = String(cString[cString.index(after: cString.startIndex)..<cString.endIndex])
            
        }
        if (cString.count != 6) {
            return UIColor.clear
        }
        //        let rString = cString.substring(to: cString.index(cString.startIndex, offsetBy: 2))
        let rString = cString[..<cString.index(cString.startIndex, offsetBy: 2)]
        //        let gString = cString.substring(with: cString.index(cString.startIndex, offsetBy: 2)..<cString.index(cString.startIndex, offsetBy: 4))
        let gString = cString[cString.index(cString.startIndex, offsetBy: 2)..<cString.index(cString.startIndex, offsetBy: 4)]
        
        //        let bString = cString.substring(from: cString.index(cString.endIndex, offsetBy: -2))
        let bString = cString[cString.index(cString.endIndex, offsetBy: -2)..<cString.endIndex]
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: String(rString)).scanHexInt32(&r)
        Scanner(string: String(gString)).scanHexInt32(&g)
        Scanner(string: String(bString)).scanHexInt32(&b)
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha!)
    }
  
}

extension UIImage {
    
    func scaleImage(scaleSize : CGFloat) -> UIImage {
        let size = CGSize(width: self.size.width * scaleSize, height: self.size.height * scaleSize)
        return self
    }
    
}

extension UIView {
    
    func x() -> CGFloat{
        return self.frame.origin.x
    }
    
    func y() -> CGFloat{
        return self.frame.origin.y
    }
    
}


