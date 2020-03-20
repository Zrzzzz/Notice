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
        
        let linepath = UIBezierPath()
        linepath.move(to: CGPoint(x: 40, y: 50)) //开始绘制，表示这个点是起点
        linepath.addLine(to: CGPoint(x: screen.width-50, y: 50))
        let line = CAShapeLayer()
        line.path = linepath.cgPath
        line.fillColor = color.cgColor
        line.strokeColor = color.cgColor
        line.lineWidth = 2
        layer.addSublayer(line)
    }
    
}
