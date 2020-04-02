//
//  CalendarHeaderView.swift
//  Notice
//
//  Created by 王申宇 on 28/03/2020.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

class CalendarHeaderView: UIView {
    private var dateLabel: UILabel!
    private var avatar: UIButton!
    private var year = TNCalendar.shared().getYear()
    private var month = TNCalendar.shared().getMonth()
    private var week = ["日","一","二","三","四","五","六"]
    private var weekLabels = [UILabel]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        addView()
        loopInitWeekView()
    }
    
    private func initView() {
        self.backgroundColor = TNColor.calendarBgc
        dateLabel = UILabel()
        dateLabel.text = "\(year)年\(month)月"
        dateLabel.font = UIFont.flexibleSystemFont(ofSize: 50 / 3)
        dateLabel.textColor = TNColor.calendarText
        dateLabel.textAlignment = .left
        avatar = UIButton()
        avatar.setImage(UIImage(named: "个人主页"), for: .normal)
        avatar.adjustsImageWhenHighlighted = false
    }
    
    private func loopInitWeekView() {
        for i in 0..<7 {
            let label = UILabel()
            label.text = week[i]
            label.textColor = TNColor.calendarSpeText
            label.font = UIFont.flexibleSystemFont(ofSize: 40 / 3)
            label.textAlignment = .left
            addSubview(label)
            weekLabels.append(label)
            if i == 0 {
                weekLabels[i].snp.makeConstraints { make in
                    make.centerX.equalTo(self.snp.left).offset(40.5)
                    make.top.equalTo(dateLabel.snp.bottom).offset(50 / 3)
                }
            }else {
                weekLabels[i].snp.makeConstraints { make in
                    make.centerX.equalTo(weekLabels[i - 1]).offset((screen.width - 35 / 3) / 7)
                    make.centerY.equalTo(weekLabels[0])
                }
            }
            
        }
        
    }
    
    private func addView() {
        addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(109 / 3)
            make.left.equalTo(self).offset(89 / 3)
        }
        addSubview(avatar)
        avatar.snp.makeConstraints { make in
            make.top.equalTo(self).offset(30)
            make.right.equalTo(self).inset(86 / 3)
            make.width.height.equalTo(86 / 3)
        }
    }
    
    public func setYear(_ year: Int) {
        self.year = year
        dateLabel.text = "\(year)年\(month)月"
    }
    
    public func setMonth(_ month: Int) {
        self.month = month
        dateLabel.text = "\(year)年\(month)月"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
