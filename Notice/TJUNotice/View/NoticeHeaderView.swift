//
//  NoticeHeaderView.swift
//  Notice
//
//  Created by Zr埋 on 2020/4/4.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

class NoticeHeaderView: UIView {
    var title: UILabel!
    var selectBtn: UIButton!
    var userBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title = UILabel()
        title.font = .systemFont(ofSize: 50 / 3)
        title.textColor = TNColor.noticetype
        title.sizeToFit()
        addSubview(title)
        title.snp.updateConstraints { (make) in
            make.width.equalTo(85)
            make.bottom.equalTo(self.snp.bottom).offset(-20)
            make.left.equalTo(self).offset(15)
        }
        
        
        selectBtn = UIButton()
        selectBtn.setImage(UIImage(systemName: "chevron.down")?.withTintColor(TNColor.noticetype, renderingMode: .alwaysOriginal), for: .normal)
        selectBtn.imageView?.adjustsImageSizeForAccessibilityContentSizeCategory = false
        addSubview(selectBtn)
        selectBtn.snp.updateConstraints { (make) in
            make.width.height.equalTo(30)
            make.centerY.equalTo(title)
            make.left.equalTo(self).offset(100)
        }
        
        
        userBtn = UIButton()
        userBtn.setImage(UIImage(named: "个人主页")?.withRenderingMode(.alwaysOriginal), for: .normal)
        addSubview(userBtn)
        userBtn.snp.updateConstraints { (make) in
            make.width.height.equalTo(86 / 3)
            make.centerY.equalTo(title)
            make.right.equalTo(self).offset(-30)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(text: String) {
        self.title.text = text
    }
}
