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
    
    var loginButton: UIButton!
    var whiteView: UIView!
    var avatar: UIImageView!
    var welcome: UILabel!
    var signin: UILabel!
    
    var assets: [LoginSetView] = []
    let titles = ["姓名", "手机号码", "邮箱", "密码", "确认密码"]
    let placeholders = ["请输入您的姓名", "请输入您的手机号码", "请输入您的邮箱", "请输入您的密码", "请确认密码"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setup()
        
    }
}

//MARK: - UI
extension LoginViewController {
    func setup() {
        view.backgroundColor = UIColor(red: 0.26, green: 0.4, blue: 0.35, alpha: 1)
        
        avatar = UIImageView()
        view.addSubview(avatar)
        avatar.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(20)
            make.top.equalTo(view).offset(50)
            make.width.height.equalTo(50)
        }
        
        welcome = UILabel()
        welcome.text = "Welcome"
        welcome.font = .systemFont(ofSize: 24)
        welcome.textColor = UIColor(red: 0.51, green: 0.6, blue: 0.57,alpha:1)
        view.addSubview(welcome)
        welcome.sizeToFit()
        welcome.snp.makeConstraints { (make) in
            make.top.equalTo(avatar).offset(30)
            make.left.equalTo(avatar)
        }
        
        signin = UILabel()
        signin.text = "Sign in"
        signin.font = .systemFont(ofSize: 40)
        signin.textColor = .white
        signin.sizeToFit()
        view.addSubview(signin)
        signin.snp.makeConstraints { (make) in
            make.top.equalTo(welcome).offset(30)
            make.left.equalTo(welcome)
        }
        
        whiteView = UIView(frame: CGRect(x: 0, y: 180, width: screen.width, height: screen.height - 100))
        whiteView.backgroundColor = .white
        whiteView.setCornerRadius(radius: 20)
        view.addSubview(whiteView)
        
        
        for i in 0..<5 {
            let asset = LoginSetView(titleText: titles[i], placeholder: placeholders[i], color: UIColor(red: 0.26, green: 0.4, blue: 0.35, alpha: 1))
            asset.frame.origin = CGPoint(x: 20, y: 100 * i + 220)
            view.addSubview(asset)
            if i == 3 { asset.textField.isSecureTextEntry = true }
            if i == 4 {
                asset.textField.isSecureTextEntry = true
                asset.textField.addTarget(self, action: #selector(checkPassword), for: .editingDidEnd)
            }
            assets.append(asset)
        }
    }
    
    @objc func checkPassword() {
        if assets[3].textField.text != assets[4].textField.text {
            assets[4].line.strokeColor = UIColor.red.cgColor
        }
    }
}
