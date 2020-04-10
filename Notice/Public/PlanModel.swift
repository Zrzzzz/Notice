//
//  PlanModel.swift
//  Notice
//
//  Created by Zr埋 on 2020/3/28.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

struct PlanModel: Codable {
    var title: String
    var startTime: Int
    var endTime: Int
    var creator: String
    var posTime: Int
    var remindMode: String?
    var repeatMode: String?
    var location: String?
    var more: String?
    var symbol: String?
}

//enum RemindEnum: Codable {
//    init(from decoder: Decoder) throws {
//        <#code#>
//    }
//
//    func encode(to encoder: Encoder) throws {
//        <#code#>
//    }
//
//    case minute, hour, day, week
//}
//
//enum RepeatEnum: Codable {
//    init(from decoder: Decoder) throws {
//        <#code#>
//    }
//
//    func encode(to encoder: Encoder) throws {
//        <#code#>
//    }
//
//    case never, day, week, doubleweek, triweek, month, year
//}
//
//enum SymbolEnum: Codable {
//    init(from decoder: Decoder) throws {
//        <#code#>
//    }
//
//    func encode(to encoder: Encoder) throws {
//        <#code#>
//    }
//
//    case yellow, red, blue, brown
//}
