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
    var calendarHeight: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    private func initView() {
        view.backgroundColor = TNColor.calendarBgc
        calendar = CalendarView(frame: .zero, collectionViewLayout: layout)
        calendar.delegate = self
        calendar.dataSource = self
        view.addSubview(calendar)
        header = CalendarHeaderView()
        view.addSubview(header)
        calendarHeight = (calendar.getLine() + 1) * 37 + 108
        tableView = ListTableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
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
            make.top.equalTo(view).offset(90)
            make.left.equalTo(view).offset(34 / 3)
            make.right.equalTo(view).inset(34 / 3)
            make.bottom.equalTo(header.snp.bottom).offset((calendar.getLine() + 1) * 37 + 18)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(calendarHeight)
            make.left.right.equalTo(view)
            make.height.equalTo(view)
        }
    }
}
