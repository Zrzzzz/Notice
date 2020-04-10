//
//  BarTextView.swift
//  Notice
//
//  Created by Zr埋 on 2020/3/28.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

class BarTextView: UIView {
    let bar = UIView()
    let text = UILabel()
    
    convenience init(x: CGFloat = 0, y: CGFloat = 0, barWidth: CGFloat, text: String, size: CGFloat, barColor: UIColor) {
        self.init()
        
        frame.origin = CGPoint(x: x, y: y)
        
        
        bar.frame.origin = CGPoint(x: 0, y: 0)
        bar.setCornerRadius(radius: barWidth / 2)
        bar.backgroundColor = UIColor(cgColor: barColor.cgColor)
        self.addSubview(bar)
        
        self.text.frame.origin = CGPoint(x: 10, y: 0)
        self.text.font = .systemFont(ofSize: size)
        self.text.text = text
        self.text.sizeToFit()
        bar.frame.size = CGSize(width: barWidth, height: self.text.frame.height)
        self.addSubview(self.text)
    }
}
