//
//  NoticeCell.swift
//  Notice
//
//  Created by Zr埋 on 2020/3/4.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

class NoticeCell: UITableViewCell {
    // 参数
    var ddlTime: Int?
    var rect = CGRect(x: 20, y: 20, width: screen.width - 40, height: screen.height - 40)
    var bgColor: UIColor?
    // 组件
    var view: UIView!
    var courseLabel: UILabel!
    var titleLabel: UILabel!
    var ddlLabel: UILabel!
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        view = UIView(frame: rect)
        view.backgroundColor = bgColor
//        view.setCornerRadius(radius: 20)
//        view.layer.shouldRasterize = true
//        view.layer.shadowOpacity = 0.2
//        view.layer.shadowPath = UIBezierPath(rect: rect.offsetBy(dx: 20, dy: 20)).cgPath
        contentView.addSubview(view)
        
        courseLabel = UILabel()
        courseLabel.font = .boldSystemFont(ofSize: 19)
        courseLabel.textAlignment = .center
        courseLabel.textColor = .systemBlue
        view.addSubview(courseLabel)
        courseLabel.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(30)
            make.top.equalTo(view).offset(20)
        }
        
        titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 19)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(courseLabel).offset(30)
        }
        
        ddlLabel = UILabel()
        ddlLabel.font = .systemFont(ofSize: 16, weight: .light)
        ddlLabel.textAlignment = .left
        ddlLabel.text = "截止日期" + (ddlTime ?? 0).timestampToDate(dateFormat: "yyyy/MM/dd hh:mm")
        view.addSubview(ddlLabel)
        ddlLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
