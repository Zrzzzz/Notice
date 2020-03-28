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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        addView()
    }
    
    private func initView() {
        date = UIView()
        date.layer.cornerRadius = 50
        gregorian = UILabel()
        gregorian.font = UIFont.flexibleSystemFont(ofSize: 40)
        chinese = UILabel()
        chinese.font = UIFont.flexibleSystemFont(ofSize: 25)
    }
    
    private func addView() {
        contentView.addSubview(date)
        date.snp.makeConstraints { make in
            make.center.equalTo(contentView)
            make.width.height.equalTo(100)
        }
        contentView.addSubview(gregorian)
        gregorian.snp.makeConstraints { make in
            make.top.equalTo(date).offset(19)
            make.centerX.equalTo(date)
        }
        contentView.addSubview(chinese)
        chinese.snp.makeConstraints { make in
            make.top.equalTo(gregorian.snp.bottom).offset(17)
            make.centerX.equalTo(date)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 
