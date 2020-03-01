//
//  LoginViewController.swift
//  Notice
//
//  Created by Zr埋 on 2020/3/1.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    var usernameLabel: UILabel!
    var usernameTextField: LoginTextField!
    var passwordLabel: UILabel!
    var passwordTextField: LoginTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setup()
        
    }
}

// UI
extension LoginViewController {
    func setup() {
        usernameTextField = LoginTextField()
        view.addSubview(usernameTextField)
        usernameTextField.placeholder = "在此输入用户名"
        usernameTextField.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerY.equalTo(view.snp.centerY)
            make.centerX.equalTo(view.snp.centerX).offset(20)
        }
        
        usernameLabel = UILabel()
        view.addSubview(usernameLabel)
        usernameLabel.text = "用户名"
        usernameLabel.font = .systemFont(ofSize: 20, weight: .medium)
        usernameLabel.sizeToFit()
        usernameLabel.snp.makeConstraints { (make) in
            make.right.equalTo(usernameTextField.snp.left).offset(-20)
            make.centerY.equalTo(usernameTextField.snp.centerY)
        }
        
        passwordTextField = LoginTextField()
        view.addSubview(passwordTextField)
        passwordTextField.placeholder = "在此输入密码"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.top.equalTo(usernameTextField).offset(40)
            make.centerX.equalTo(usernameTextField.snp.centerX)
        }
        
        passwordLabel = UILabel()
        view.addSubview(passwordLabel)
        passwordLabel.text = "密码"
        passwordLabel.font = .systemFont(ofSize: 20, weight: .medium)
        passwordLabel.sizeToFit()
        passwordLabel.snp.makeConstraints { (make) in            make.right.equalTo(passwordTextField.snp.left).offset(-20)
            make.centerY.equalTo(passwordTextField.snp.centerY)
        }

    }
}
