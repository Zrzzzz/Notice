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
    var swipeGesture: UISwipeGestureRecognizer!
    var returnBtn: UIButton!
    
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
        tableView.listHeader.addData("\(calendar.month)月\(calendar.today!)日")
        view.addSubview(tableView)
        returnBtn = UIButton()
        returnBtn.backgroundColor = .red
        returnBtn.addTarget(self, action: #selector(gt), for: .touchUpInside)
        tableView.addSubview(returnBtn)
        initSwipe()
    }
    
    @objc func gt() {
        calendar.snp.updateConstraints { make in
            //(screen.width - 68 / 3) / 7
            make.top.equalTo(view).offset(90)
            make.left.equalTo(view).offset(34 / 3)
            make.right.equalTo(view).inset(34 / 3)
            make.bottom.equalTo(header.snp.bottom).offset((calendar.getLine() + 1) * 37 + 18)
        }
        tableView.snp.updateConstraints { make in
            make.top.equalTo(view).offset(calendarHeight)
            make.left.right.equalTo(view)
            make.height.equalTo(view)
        }
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func initSwipe() {
        swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeGesture.direction = .down
        swipeGesture.delegate = self
        calendar.addGestureRecognizer(swipeGesture)
    }
    
    @objc func handleSwipeGesture(_ sender: UISwipeGestureRecognizer) {
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
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
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
        returnBtn.snp.makeConstraints { make in
            make.top.equalTo(tableView).offset(10)
            make.right.equalTo(tableView).inset(10)
            make.width.height.equalTo(100)
        }
    }
}

extension ScheduleController: UIGestureRecognizerDelegate {
    
}
