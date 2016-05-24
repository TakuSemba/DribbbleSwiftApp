//
//  Color.swift
//  DribbbleSwiftApp
//
//  Created by TakuSemba on 2016/05/31.
//  Copyright © 2016年 TakuSemba. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    class func hexStr (hexStr : NSString, alpha : CGFloat) -> UIColor {
        var hexStr = hexStr;
        hexStr = hexStr.stringByReplacingOccurrencesOfString("#", withString: "")
        let scanner = NSScanner(string: hexStr as String)
        var color: UInt32 = 0
        if scanner.scanHexInt(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string", terminator: "")
            return UIColor.whiteColor();
        }
    }
    
    class func blueishWhiteColor() -> UIColor {
        return UIColor.hexStr("ecfafb", alpha: 1)
    }
    
    class func blueishBlackColor() -> UIColor {
        return UIColor.hexStr("263238", alpha: 1)
    }
    
    class func pinkColor() -> UIColor {
        return UIColor.hexStr("F06292", alpha: 1)
    }
    
    class func blueishDarkerWhiteColor() -> UIColor {
        return UIColor.hexStr("bcc8c8", alpha: 1)
    }
}