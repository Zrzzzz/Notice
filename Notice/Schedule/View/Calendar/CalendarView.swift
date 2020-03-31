//
//  CalendarView.swift
//  Notice
//
//  Created by 王申宇 on 25/03/2020.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

class CalendarView: UICollectionView {
    private var year = TNCalendar.shared().getYear()
    private var month = TNCalendar.shared().getMonth()
    private var days: Int!
    private var line: Int!
    private var firstdayOfWeek: Int!
    private var date: [Int]!
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        initView()
        loadData()
        self.register(CalendarCell.self, forCellWithReuseIdentifier: "calendarcell")
        delegate = self
        dataSource = self
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
    }
    
    private func loadData() {
        days = TNCalendar.shared().numberOfDaysInMonth()
        firstdayOfWeek = TNCalendar.shared().firstDayOfWeekInMonth()
        line = (Int)((days - (7 - firstdayOfWeek)) / 7) + 2
        print("日期数据加载完成")
    }
}

extension CalendarView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if line == nil {return 0}
        return 7 * line
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calendarcell", for: indexPath) as! CalendarCell
        let day = indexPath.row - firstdayOfWeek + 2
        cell.gregorian.text = day > 0 && day <= self.days ? "\(day)" : ""
        let che = TNCalendar.shared().solarToLunar(year, month, day)
        let realChe = che.suffix(2) == "初一" ? che.suffix(4).prefix(2) : che.suffix(2)
        
        cell.chinese.text = day > 0 && day <= self.days ? String(realChe) : ""
        return cell
    }
}

extension CalendarView: UICollectionViewDelegateFlowLayout {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 143 / 3, height: 37)
    }
    
}
