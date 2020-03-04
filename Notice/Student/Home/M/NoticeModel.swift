//
//  NoticeModel.swift
//  Notice
//
//  Created by Zr埋 on 2020/3/4.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

struct NoticeModel: Codable {
    let id: Int?
    let type: Int?
    let course: String?
    let title: String?
    let detail: String?
    let ddl: Int?
}
