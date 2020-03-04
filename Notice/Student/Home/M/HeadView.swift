//
//  HeadView.swift
//  Notice
//
//  Created by Zr埋 on 2020/3/4.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

class HeadView: UIView {
    var color: UIColor?
    var text: String = ""
    
    convenience init(color: UIColor, text: String) {
        self.init()
        self.color = color
        self.text = text
        
        let title = UILabel(frame: CGRect(x: 40, y: 5, width: 200, height: 40))
        title.font = .boldSystemFont(ofSize: 19)
        title.textColor = color
        title.text = text
        addSubview(title)
        
//        let line = 
    }
    
}
