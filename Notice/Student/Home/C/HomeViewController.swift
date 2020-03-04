//
//  HomeViewController.swift
//  Notice
//
//  Created by Zr埋 on 2020/3/4.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var newNotices: [NoticeModel] = [NoticeModel(id: 1, type: 0, course: "高等数学", title: "xswl", detail: nil, ddl: 1583298843)]
    var readNotices: [NoticeModel] = []
    var outNotices:[NoticeModel] = []
    var tableView: UITableView!
//    var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }
}

//MARK: - UI
extension HomeViewController {
    func setup() {
        view.backgroundColor = .systemBackground
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: screen.width, height: screen.height))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        view.addSubview(tableView)
    }
}

//MARK: - TableView 协议
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
        case 0:
            return HeadView(color: .systemBlue, text: "新通知")
        case 1:
            return HeadView(color: .black, text: "已读通知")
        default:
            return HeadView(color: .systemGray, text: "过期通知")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return newNotices.count
        case 1:
            return readNotices.count
        default:
            return outNotices.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "homeCell"
        tableView.register(NoticeCell.self, forCellReuseIdentifier: cellid)
        let cell: NoticeCell = tableView.dequeueReusableCell(withIdentifier: cellid) as! NoticeCell
        switch indexPath.section {
        case 0:
            let notice = newNotices[indexPath.row]
            cell.courseLabel.text = notice.course
            cell.titleLabel.text = notice.title
            cell.ddlTime = notice.ddl
            cell.bgColor = .orange
        case 1:
            let notice = readNotices[indexPath.row]
            cell.courseLabel.text = notice.course
            cell.titleLabel.text = notice.title
            cell.ddlTime = notice.ddl
            
        default:
            let notice = outNotices[indexPath.row]
            cell.courseLabel.text = notice.course
            cell.titleLabel.text = notice.title
            cell.ddlTime = notice.ddl
            
        }
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}