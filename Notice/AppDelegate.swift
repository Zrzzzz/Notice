//
//  AppDelegate.swift
//  Notice
//
//  Created by Zr埋 on 2020/3/1.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
     var window: UIWindow?
//        var tabs = ["音乐", "我的", "账号"]
       

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            self.window?.rootViewController = LoginViewController()
            self.window?.makeKeyAndVisible()
            
    
            return true
        }

}

