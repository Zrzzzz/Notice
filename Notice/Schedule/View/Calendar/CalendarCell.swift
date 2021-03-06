//
//  CalendarCell.swift
//  Notice
//
//  Created by 王申宇 on 26/03/2020.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    var date: UIView!
    var gregorian: UILabel!
    var chinese: UILabel!
    var festival: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        addView()
    }
    
    private func initView() {
        date = UIView()
        date.backgroundColor = .white
        date.layer.cornerRadius = 59 / 3
        date.layer.masksToBounds = true
        date.isHidden = true
        gregorian = UILabel()
        gregorian.font = UIFont.flexibleSystemFont(ofSize: 40 / 3)
        chinese = UILabel()
        chinese.font = UIFont.flexibleSystemFont(ofSize: 25 / 3)
        festival = UILabel()
        festival.backgroundColor = TNColor.festival
        festival.layer.cornerRadius = 3
        festival.layer.masksToBounds = true
    }
    
    private func addView() {
        contentView.addSubview(date)
        date.snp.makeConstraints { make in
            make.center.equalTo(contentView).offset(5)
            make.width.height.equalTo(118 / 3)
        }
        contentView.addSubview(gregorian)
        gregorian.snp.makeConstraints { make in
            make.top.equalTo(date).offset(3)
            make.centerX.equalTo(date)
        }
        contentView.addSubview(chinese)
        chinese.snp.makeConstraints { make in
            make.top.equalTo(gregorian.snp.bottom).offset(17 / 3)
            make.centerX.equalTo(date)
        }
        contentView.addSubview(festival)
        festival.snp.makeConstraints { make in
            make.top.equalTo(chinese.snp.bottom).offset(8 / 3)
            make.centerX.equalTo(date)
            make.width.height.equalTo(6)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 
