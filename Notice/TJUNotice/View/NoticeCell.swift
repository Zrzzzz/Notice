//
//  NoticeCell.swift
//  Notice
//
//  Created by Zr埋 on 2020/3/29.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

class NoticeCell: UITableViewCell {
    var backView: UIView!
    var title: BarTextView!
    var durTime: BarTextView!
    var more: UILabel!
    var creator: UILabel!
    var posTime: UILabel!
    var editBtn: UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backView = UIView(frame: CGRect(x: 10, y: 0, width: screen.width - 20, height: 150))
        backView.setCornerRadius(radius: 5)
        backView.backgroundColor = .systemBackground
        contentView.addSubview(backView)
        
        title = BarTextView(barWidth: 8 / 3, text: "还没有内容", size: 40 / 3, barColor: TNColor.mainColor)
        backView.addSubview(title)
        title.snp.updateConstraints { (make) in
            make.left.equalTo(backView).offset(5)
            make.top.equalTo(backView).offset(5)
            make.height.equalTo(20)
        }
        
        durTime = BarTextView(barWidth: 8 / 3, text: "还没有内容", size: 40 / 3, barColor: TNColor.mainColor)
        backView.addSubview(durTime)
        durTime.snp.updateConstraints { (make) in
            make.left.equalTo(backView).offset(5)
            make.top.equalTo(title.snp.bottom).offset(5)
            make.height.equalTo(20)
        }
        
        more = UILabel()
        more.font = .systemFont(ofSize: 40 / 3)
        more.numberOfLines = 0
        backView.addSubview(more)
        more.snp.updateConstraints { (make) in
            make.left.equalTo(backView).offset(5)
            make.top.equalTo(durTime.snp.bottom).offset(5)
            make.right.equalTo(backView).offset(-10)
        }
        
        creator = UILabel()
        creator.font = .systemFont(ofSize: 35 / 3, weight: .light)
        creator.textColor = .systemGray
        backView.addSubview(creator)
        creator.snp.updateConstraints { (make) in
            make.bottom.equalTo(backView)
            make.right.equalTo(backView).offset(-70)
        }
        
        posTime = UILabel()
        posTime.font = .systemFont(ofSize: 35 / 3, weight: .light)
        posTime.textColor = .systemGray
        backView.addSubview(posTime)
        posTime.snp.updateConstraints { (make) in
            make.bottom.equalTo(backView)
            make.right.equalTo(backView).offset(-5)
        }
        
        editBtn = UIButton()
        editBtn.setImage(#imageLiteral(resourceName: "edit"), for: .normal)
        backView.addSubview(editBtn)
        editBtn.snp.updateConstraints { (make) in
            make.right.equalTo(backView).offset(-10)
            make.top.equalTo(backView).offset(10)
            make.width.equalTo(20)
            make.height.equalTo(20 * 13 / 50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
