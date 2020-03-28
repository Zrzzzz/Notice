//
//  TotalExtension.swift
//  Notice
//
//  Created by Zr埋 on 2020/3/4.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit
import CommonCrypto

let screen = UIScreen.main.bounds

extension UIView {
    func setCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    //    返回父View
    func superView<T: UIView>(of: T.Type) -> T? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let father = view as? T {
                return father
            }
        }
        return nil
    }

}

extension Int {
    func timestampToDate(dateFormat: String) -> String {
        //时间戳, 而且这个是毫秒级
        let timeStamp = self / 1000
        //转换为时间
        let timeInterval:TimeInterval = TimeInterval(timeStamp)
        let date = NSDate(timeIntervalSince1970: timeInterval)
        //格式化输出
        let dformatter = DateFormatter()
        dformatter.dateFormat = dateFormat
        let y = dformatter.string(from: date as Date)
        return y
    }
}


extension String {
    func md5() -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return String(format: hash as String)
    }
    
    func dateToTimeStamp()-> Int {

        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy-MM-dd"
        let date = dfmatter.date(from: self)
        
        let dateStamp: TimeInterval = date!.timeIntervalSince1970
        
        let dateSt:Int = Int(dateStamp)
        
        return dateSt
        
    }
}

extension UIColor {
/**
 The six-digit hexadecimal representation of color of the form #RRGGBB.
 
 - parameter hex6: Six-digit hexadecimal value.
 */
public convenience init(hex6: UInt32, alpha: CGFloat = 1) {
    // TODO: below
    // Store Hex converted UIColours (R, G, B, A) to a persistent file (.plist)
    // And when initializing the app, read from the plist into the memory as a static struct (Metadata.Color)
    let divisor = CGFloat(255)
    let r = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
    let g = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
    let b = CGFloat( hex6 & 0x0000FF       ) / divisor
    self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}

extension UIFont {
    static func flexibleSystemFont(ofSize size: CGFloat) -> UIFont {
        var size = size
        if UIDevice.current.model != "iPad" {
            size = (UIScreen.main.bounds.size.width / 375.0) * size
        }
        return UIFont.systemFont(ofSize: size)
    }
    
    static func flexibleSystemFont(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        var size = size
        if UIDevice.current.model != "iPad" {
            size = (UIScreen.main.bounds.size.width / 375.0) * size
        }
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
}
