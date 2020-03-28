//
//  CalendarView.swift
//  Notice
//
//  Created by 王申宇 on 25/03/2020.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

class CalendarView: UICollectionView {
    private var year: Int!
    private var month: Int!
    private var days: Int!
    private var line: Int!
    private var firstdayOfWeek: Int!
    private var date: [Int]!
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.register(CalendarCell.self, forCellWithReuseIdentifier: "calendercell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        self.backgroundColor = TNColor.calendarBgc
    }
    
    private func loadData() {
        days = TNCalendar.shared().numberOfDaysInMonth()
        firstdayOfWeek = TNCalendar.shared().firstDayOfWeekInMonth()
        
    }
}

extension CalendarView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    
}
