//
//  LoginSetView.swift
//  Notice
//
//  Created by Zr埋 on 2020/3/20.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

class LoginSetView: UIView {
    var color: CGColor!
    let grayColor: CGColor = UIColor.systemGray.cgColor
    var textField: UITextField!
    var line: CAShapeLayer!
    
    convenience init(titleText: String, placeholder: String, color: UIColor) {
        self.init()
        self.color = color.cgColor
        
//        self.frame.size = CGSize(width: screen.width, height: 100)
//        let bar = UIView(frame: CGRect(x: 5, y: 10, width: 5, height: 28))
//        bar.setCornerRadius(radius: 2)
//        bar.backgroundColor = UIColor(cgColor: self.color)
//        self.addSubview(bar)
//
//        let title = UILabel(frame: CGRect(x: 15, y: 0, width: screen.width - 50, height: 50))
//        title.font = .systemFont(ofSize: 20)
//        title.text = titleText
//        self.addSubview(title)
        
        let title = BarTextView(barWidth: 5, text: titleText, size: 20, barColor: color)
        self.addSubview(title)
        
        textField = UITextField(frame: CGRect(x: 15, y: 35, width: 300, height: 50))
        textField.placeholder = placeholder
        textField.font = .systemFont(ofSize: 15, weight: .light)
        textField.addTarget(self, action: #selector(isediting), for: .editingChanged)
        self.addSubview(textField)
        
        let linepath = UIBezierPath()
        linepath.move(to: CGPoint(x: 5, y: 75)) // 开始绘制，表示这个点是起点
        linepath.addLine(to: CGPoint(x: screen.width - 70, y: 75)) // 终点
        line = CAShapeLayer()
        line.path = linepath.cgPath
//        line.fillColor = color.cgColor
        line.strokeColor = grayColor
        line.lineWidth = 1
        layer.addSublayer(line)
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
    }
    
    @objc func isediting() {
        if textField.text != "" {
            line.strokeColor = self.color
        } else {
            line.strokeColor = grayColor
        }
    }
}
