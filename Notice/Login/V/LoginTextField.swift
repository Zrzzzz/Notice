//
//  LoginTextField.swift
//  Notice
//
//  Created by Zr埋 on 2020/3/1.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

class LoginTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func layoutSubviews() {
        super .layoutSubviews()
        
        self.setCornerRadius(radius: 10)
        self.layer.borderColor = .init(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        self.layer.borderWidth = 1
        
    }
}
