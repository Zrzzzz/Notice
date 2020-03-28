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
       
    let tabbarController = STTabBarController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let scheduleController = UINavigationController(rootViewController: ScheduleController())
        let noticeController = UINavigationController(rootViewController: NoticeController())
        scheduleController.setNavigationBarHidden(true, animated: false)
        noticeController.setNavigationBarHidden(true, animated: false)
        
        tabbarController.addChildController(childController: scheduleController, nor_image: UIImage(named: "schedule_normal")!, sel_image: UIImage(named: "schedule_highlighting")!)
        tabbarController.addChildController(childController: noticeController, nor_image: UIImage(named: "notice_normal")!, sel_image: UIImage(named: "notice_highlighting")!)
//        tabbarController.tabBarItem.image
        let tabBarController = UINavigationController.init(rootViewController: tabbarController)
        tabBarController.setNavigationBarHidden(true, animated: false)
        self.window?.rootViewController = tabBarController
        window?.backgroundColor = .white
        return true
        }

}

