//
//  ScheduleController.swift
//  Notice
//
//  Created by 王申宇 on 23/03/2020.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit
import SnapKit

class ScheduleController: UIViewController {
    var calendar: CalendarView!
    let layout = UICollectionViewFlowLayout()
    var header: CalendarHeaderView!
    var tableView: ListTableView!
    var calendarHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = TNColor.calendarBgc
        header = CalendarHeaderView()
        view.addSubview(header)
        calendar = CalendarView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(calendar)
        calendarHeight = CGFloat((calendar.getLine() + 1) * 37 + 108)
        tableView = ListTableView(frame: CGRect(x: 0, y: calendarHeight, width: screen.width, height: screen.height - calendarHeight), style: .grouped)
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        header.snp.makeConstraints { make in
            make.top.left.right.equalTo(view)
            make.height.equalTo(90)
        }
        calendar.snp.makeConstraints { make in
            //(screen.width - 68 / 3) / 7
            make.top.equalTo(header.snp.bottom)
            make.left.equalTo(view).offset(34 / 3)
            make.right.equalTo(view).inset(34 / 3)
            make.height.equalTo((calendar.getLine() + 1) * 37 + 18)
        }
    }
}
