//
//  ColorStorage.swift
//  Notice
//
//  Created by 王申宇 on 27/03/2020.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import Foundation
import UIKit

struct TNColor {
    static let calendarBgc = UIColor.init { trainCollection -> UIColor in
        if trainCollection.userInterfaceStyle == .dark {
            return UIColor.black
        } else {
            return UIColor(hex6: 0x8db0a9)
        }
    }
}
