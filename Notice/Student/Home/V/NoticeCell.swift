//
//  NoticeCell.swift
//  Notice
//
//  Created by Zr埋 on 2020/3/4.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

class NoticeCell: UITableViewCell {
    // 组件
    var view: UIView!
    var courseLabel: UILabel!
    var titleLabel: UILabel!
    var ddlLabel: UILabel!
    
    
    
    convenience init(bgColor: UIColor, course: String, title: String, ddl: Int) {
        self.init(style: .default, reuseIdentifier: "NoticeCell")
        view = UIView()
        view.backgroundColor = bgColor
        view.setCornerRadius(radius: 20)
        contentView.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.width.equalTo(screen.width - 80)
            make.height.equalTo(80)
            make.centerX.centerY.equalTo(contentView)

        }
        
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = CGSize(width: 20, height: 20)
        view.layer.shadowColor = bgColor.cgColor
        view.layer.shadowPath = UIBezierPath(rect: CGRect(x: view.bounds.width, y: view.bounds.height, width: 10, height: 10)).cgPath
        
        courseLabel = UILabel()
        courseLabel.text = course
        courseLabel.font = .boldSystemFont(ofSize: 19)
        courseLabel.textAlignment = .center
        courseLabel.textColor = .systemBlue
        view.addSubview(courseLabel)
        courseLabel.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(10)
            make.top.equalTo(view).offset(10)
        }
        
        titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 19)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(courseLabel.snp.right).offset(30)
            make.bottom.equalTo(courseLabel)
        }
        
        ddlLabel = UILabel()
        ddlLabel.font = .systemFont(ofSize: 16, weight: .light)
        ddlLabel.textAlignment = .left
        ddlLabel.text = "截止日期" + ddl.timestampToDate(dateFormat: "yyyy/MM/dd hh:mm")
        view.addSubview(ddlLabel)
        ddlLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.equalTo(view).offset(20)
        }
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
