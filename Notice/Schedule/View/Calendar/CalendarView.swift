//
//  CalendarView.swift
//  Notice
//
//  Created by 王申宇 on 25/03/2020.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

class CalendarView: UICollectionView {
    var year = TNCalendar.shared().getYear()
    var month = TNCalendar.shared().getMonth()
    var days: Int!
    var line: Int!
    var firstdayOfWeek: Int!
    var date: [Int]!
    var selectItem: IndexPath!
    var today: Int!
    var selectDay: String!
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        initView()
        loadData()
        self.register(CalendarCell.self, forCellWithReuseIdentifier: "calendarcell")
    }
    
    override func reloadData() {
        super.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func getLine() -> Int {
        return line
    }
    
    private func initView() {
        self.backgroundColor = TNColor.calendarBgc
        self.minimumZoomScale = 0
        today = Calendar.current.component(.day, from: Date())
        selectDay = "\(month)月\(today)日"
    }
    
    private func loadData() {
        days = TNCalendar.shared().numberOfDaysInMonth()
        firstdayOfWeek = TNCalendar.shared().firstDayOfWeekInMonth()
        line = (Int)((days - (7 - firstdayOfWeek)) / 7) + 2
        print("日期数据加载完成")
    }
}

extension ScheduleController: UICollectionViewDataSource {
    
    func reloadSelectItem(_ index: IndexPath) {
        //取消原本选中item
        let cell = calendar.cellForItem(at: self.calendar!.selectItem) as! CalendarCell
        cell.date.isHidden = true
        cell.gregorian.textColor = TNColor.dateNor
        cell.chinese.textColor = TNColor.dateNor
        //更新选中item
        self.calendar!.selectItem = index
        let select = calendar.cellForItem(at: index) as! CalendarCell
        select.date.isHidden = false
        select.gregorian.textColor = TNColor.dateSpe
        select.chinese.textColor = TNColor.dateSpe
        self.tableView.listHeader.addData("\(self.calendar.month)月\(select.gregorian.text ?? "")日") 
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if calendar.line == nil {return 0}
        return 7 * calendar.line
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calendarcell", for: indexPath) as! CalendarCell
        let day = indexPath.row - calendar.firstdayOfWeek + 2
        cell.gregorian.text = day > 0 && day <= calendar.days ? "\(day)" : ""
        let che = TNCalendar.shared().solarToLunar(calendar.year, calendar.month, day)
        let realChe = che.suffix(2) == "初一" ? che.suffix(4).prefix(2) : che.suffix(2)
        let date = TNCalendar.shared().getSelectDate(calendar.year, calendar.month, day)
        if TNCalendar.shared().lunarSpecialDate(date) == nil && TNCalendar.shared().lunarHoliDayDate(date) == nil {
            cell.festival.isHidden = true
        }
        cell.chinese.text = day > 0 && day <= calendar.days ? String(realChe) : ""
        if (indexPath.row + 1) % 7 == 0 || indexPath.row % 7 == 0 {
            cell.gregorian.textColor = TNColor.dateSpe
            cell.chinese.textColor = TNColor.dateSpe
        } else {
            cell.gregorian.textColor = TNColor.dateNor
            cell.chinese.textColor = TNColor.dateNor
        }
        if self.calendar.today == day {
            cell.date.isHidden = false
            cell.gregorian.textColor = TNColor.dateSpe
            cell.chinese.textColor = TNColor.dateSpe
            self.calendar.selectItem = indexPath
        }
        return cell
    }
}

extension ScheduleController: UICollectionViewDelegateFlowLayout {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 143 / 3, height: 37)
    }
    
}

extension ScheduleController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //日历和列表进行动态移动
        let itemLine = Int((indexPath.row + 1) / 7)
        if itemLine < 2 {
            self.calendar.snp.updateConstraints { make in
                make.top.equalTo(view).offset(90 - (self.calendarHeight / 7) * itemLine)
            }
        } else {
            self.calendar.snp.updateConstraints { make in
                make.top.equalTo(view).offset(90 - (self.calendarHeight / 7) * (itemLine + 1))
            }
        }
        self.tableView.snp.updateConstraints { make in
            make.top.equalTo(view).offset(self.calendarHeight - self.calendarHeight * (self.calendar.line - 1) / 7)
        }
        //更新选中块
        reloadSelectItem(indexPath)
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
        
    }
}
