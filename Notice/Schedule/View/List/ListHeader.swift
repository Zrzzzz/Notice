//
//  ListHeader.swift
//  Notice
//
//  Created by 王申宇 on 31/03/2020.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

class ListHeader: UIView {
    
    var date: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        addView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        date = UILabel()
        date.textColor = TNColor.listTitle
        date.font = UIFont.flexibleSystemFont(ofSize: 15)
    }
    
    private func addView() {
        self.addSubview(date)
        date.snp.makeConstraints { make in
            make.left.equalTo(self).offset(86 / 3)
            make.top.equalTo(self).offset(4)
        }
    }
    
    public func addData(_ str: String) {
        date.text = str
    }
}
