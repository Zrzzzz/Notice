//
//  STTabBar.swift
//  Notice
//
//  Created by 王申宇 on 2019/11/4.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

protocol STTabBarDelegate: UITabBarDelegate {
    func STTabBarCenterButtonClicked()
}


class STTabBar: UITabBar, UITabBarDelegate {
    var stTabBarDelegate: STTabBarDelegate?
    var tableview: UITableView!
    var cellList: [String]!
    
    fileprivate var centerButton: STTabBarCenterButton = {
        var height:CGFloat = 104
        if screen.height >= 812{
            height = 104 + 34
        }
        let button = STTabBarCenterButton.init(frame: CGRect(x: 0, y: height, width: 40, height: 40))
        button.adjustsImageWhenHighlighted = false
        button.addTarget(self, action: #selector(centerButtonClicked), for: .touchUpInside)
        return button
    }()
    fileprivate var currentItemIndex = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.barTintColor = .white
        initTableview()
        addCenterButton()
    }
    //添加中间按钮
    func addCenterButton(){
        self.addSubview(self.centerButton)
    }
//MARK: - 添加栏
    func initTableview() {
        setCell()
        tableview = UITableView(frame: .zero, style: .grouped)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.backgroundColor = TNColor.textBgc
        tableview.layer.cornerRadius = 18
        tableview.layer.masksToBounds = true
        window?.addSubview(tableview)
//        tableview.snp.makeConstraints { make in
//            make.centerX.equalTo(window!)
//            make.bottom.equalTo()
//        }
    }
    
    
    func setCell() {
        cellList = ["添加日程","添加小组","发送通知"]
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for tabBarItem in self.subviews {
            if String(describing: tabBarItem.self).contains("STTabBarCenterButton") {
                tabBarItem.center = CGPoint.init(x: self.center.x, y: self.centerButton.bounds.height)
            }
            if String(describing: tabBarItem.self).contains("UITabBarButton") {
                var frame = tabBarItem.frame
                frame.size.width = (self.bounds.width - self.centerButton.bounds.width)/CGFloat((self.items?.count)!)
                if currentItemIndex < 1{//如果
                    frame.origin.x = CGFloat(currentItemIndex) * frame.size.width - 35
                }else{
                    frame.origin.x = CGFloat(currentItemIndex) * frame.size.width + self.centerButton.bounds.width + 35
                }
                tabBarItem.frame = frame
                currentItemIndex += 1
                if currentItemIndex == self.items?.count{
                    currentItemIndex = 0
                }
            }
        }
    }
    //重写hitTest方法，让突出的部分也有点击效果
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        //这一个判断是关键，不判断的话push到其他页面，点击中间按钮的位置也是会有反应的，这样就不好了
        //self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
        //在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在中间按钮身上
        //是的话让中间按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
        if self.isHidden == false {
            //将当前tabbar的触摸点转换坐标系，转换到中间按钮的身上，生成一个新的点
            let newP = self.convert(point, to: self.centerButton)
            //判断如果这个新的点是在中间按钮身上，那么处理点击事件最合适的view就是中间按钮
            if self.centerButton.point(inside: newP, with: event){
                return self.centerButton
            }else{//如果点不在发布中间身上，直接让系统处理就可以了
                return super.hitTest(point, with: event)
            }
        }else{//tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
            return super.hitTest(point, with: event)
        }
    }

    deinit {
        self.removeObserver(self, forKeyPath: "name", context: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc  func centerButtonClicked(){
        debugPrint("中间按钮点击了")
        if self.stTabBarDelegate != nil {
            self.stTabBarDelegate?.STTabBarCenterButtonClicked()
        }
        
    }
}

extension STTabBar: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let label = UILabel()
        label.text = cellList[indexPath.row]
        if indexPath.row == 0 {
            label.textColor = TNColor.calendarBgc
        } else {
            label.textColor = TNColor.listTime
        }
        label.textAlignment = .center
        cell.contentView.addSubview(label)
        label.snp.makeConstraints {$0.edges.equalTo(cell.contentView)}
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: break
        case 1: break
        default: break
        }
    }
    
    
}
