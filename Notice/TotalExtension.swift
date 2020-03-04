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

