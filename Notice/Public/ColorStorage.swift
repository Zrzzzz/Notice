//
//  ColorStorage.swift
//  Notice
//
//  Created by 王申宇 on 27/03/2020.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import Foundation
import UIKit

public struct TNColor {
    static let calendarBgc = UIColor.init { trainCollection -> UIColor in
        return trainCollection.userInterfaceStyle == .dark ? UIColor(hex6: 0x8DB0A9): UIColor(hex6: 0x8DB0A9)
    }
    static let calendarText = UIColor.init { trainCollection -> UIColor in
        return trainCollection.userInterfaceStyle == .dark ? UIColor(hex6: 0xFFFFFF): UIColor(hex6: 0xFFFFFF)
    }
    static let calendarSpeText = UIColor.init { trainCollection -> UIColor in
        return trainCollection.userInterfaceStyle == .dark ? UIColor(hex6: 0xF2D8B3): UIColor(hex6: 0xF2D8B3)
    }
    static let listTitle = UIColor.init { trainCollection -> UIColor in
        return trainCollection.userInterfaceStyle == .dark ? UIColor(hex6: 0x222222): UIColor(hex6: 0x222222)
    }
    static let listAddress = UIColor.init { trainCollection -> UIColor in
        return trainCollection.userInterfaceStyle == .dark ? UIColor(hex6: 0x777777): UIColor(hex6: 0x777777)
    }
    static let listTime = UIColor.init { trainCollection -> UIColor in
        return trainCollection.userInterfaceStyle == .dark ? UIColor(hex6: 0x444444): UIColor(hex6: 0x444444)
    }
    static let listHandle = UIColor.init { trainCollection -> UIColor in
        return trainCollection.userInterfaceStyle == .dark ? UIColor(hex6: 0xB5B5B5): UIColor(hex6: 0xB5B5B5)
    }
    static let festival = UIColor.init { trainCollection -> UIColor in
        return trainCollection.userInterfaceStyle == .dark ? UIColor(hex6: 0xE6D6BB): UIColor(hex6: 0xE6D6BB)
    }
    static let dateNor = UIColor.init { trainCollection -> UIColor in
        return trainCollection.userInterfaceStyle == .dark ? UIColor(hex6: 0xFFFFFF): UIColor(hex6: 0xFFFFFF)
    }
    static let dateSpe = UIColor.init { trainCollection -> UIColor in
        return trainCollection.userInterfaceStyle == .dark ? UIColor(hex6: 0xFBD266): UIColor(hex6: 0xFBD266)
    }

    static let textBgc = UIColor.init { trainCollection -> UIColor in
        return trainCollection.userInterfaceStyle == .dark ? UIColor(hex6: 0xF7F7F7): UIColor(hex6: 0xF7F7F7)
    }
    static let noticetype = UIColor.init { trainCollection -> UIColor in
        return trainCollection.userInterfaceStyle == .dark ? UIColor(hex6: 0xFFFFFF): UIColor(hex6: 0xFFFFFF)
    }
    static let mainColor = UIColor { (trait) -> UIColor in
        return trait.userInterfaceStyle == .dark ? UIColor.black : UIColor(hex6: 0x94afa9)
    }
}
