//
//  ListCell.swift
//  Notice
//
//  Created by 王申宇 on 31/03/2020.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    var sign: UILabel!
    var title: UILabel!
    var address: UILabel!
    var time: UILabel!
    
    override var frame: CGRect {
        didSet {
            var newframe = frame
            newframe.origin.x += 10
            newframe.origin.y += 13 / 6
            newframe.size.height -= 13 / 3
            newframe.size.width -= 20
            super.frame = newframe
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
        addData()
        addView()
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        self.layer.cornerRadius = 10
        self.backgroundColor = .white
        
        sign = UILabel()
        sign.layer.cornerRadius = 2
        sign.layer.masksToBounds = true
        
        title = UILabel()
        title.textColor = TNColor.listTitle
        title.font = UIFont.flexibleSystemFont(ofSize: 40 / 3)
        
        address = UILabel()
        address.textColor = TNColor.listAddress
        address.font = UIFont.flexibleSystemFont(ofSize: 35 / 3)
        
        time = UILabel()
        time.textColor = TNColor.listTime
        time.font = UIFont.flexibleSystemFont(ofSize: 40 / 3)
    }
    
    private func addView() {
        contentView.addSubview(sign)
        sign.snp.makeConstraints { make in
            make.left.equalTo(self).offset(5)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).inset(10)
            make.width.equalTo(4)
        }
        contentView.addSubview(title)
        title.snp.makeConstraints { make in
            make.left.equalTo(sign).offset(12)
            make.top.equalTo(self).offset(14)
        }
        contentView.addSubview(address)
        address.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(6)
            make.left.equalTo(title)
        }
        contentView.addSubview(time)
        time.snp.makeConstraints { make in
            make.top.equalTo(title)
            make.right.equalTo(self).inset(19)
        }
    }
    
    public func addData() {
        title.text = "设计中期实践"
        sign.backgroundColor = UIColor(hex6: 0xFBD266)
        address.text = "建筑学院西楼105"
        time.text = "上午 8:30-11:30"
    }
}
