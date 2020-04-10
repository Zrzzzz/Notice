//
//  NoticeController.swift
//  Notice
//
//  Created by 王申宇 on 24/03/2020.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

class NoticeController: UIViewController {
    var headerView: NoticeHeaderView!
    var tableView: UITableView!
    var noticeDic: [String : [PlanModel]] = ["测试1": [PlanModel(title: "测试", startTime: 1585900000, endTime: 1585988000, creator: "zzx", posTime: 1532288000, more: "这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试r这是一个测试这是一个测试这是一个测试这是一个测试")], "测试2": [PlanModel(title: "测试", startTime: 1585900000, endTime: 1585988000, creator: "zzx", posTime: 1585998719, more: "2233nekoneko2233nekoneko2233nekoneko2233nekoneko2233nekoneko2233nekoneko2233nekoneko2233nekoneko2233nekoneko2233nekoneko2233nekoneko")], "测试3": [PlanModel(title: "测试", startTime: 1585900000, endTime: 1585988000, creator: "zzx", posTime: 1585900000, more: "啊哈哈啊哈哈哈哈啊啊哈哈啊哈哈哈哈啊啊哈哈啊哈哈哈哈啊啊哈哈啊哈哈哈哈啊啊哈哈啊哈哈哈哈啊啊哈哈啊哈哈哈哈啊啊哈哈啊哈哈哈哈啊啊哈哈啊哈哈哈哈啊啊哈哈啊哈哈哈哈啊啊哈哈啊哈哈哈哈啊啊哈哈啊哈哈哈哈啊啊哈哈啊哈哈哈哈啊啊哈哈啊哈哈哈哈啊啊哈哈啊哈哈哈哈啊啊哈哈啊哈哈哈哈啊啊哈哈啊哈哈哈哈啊")]]
    var types: [String] = []
    var selectedType: String = ""
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setup()
    }
}

//MARK: - UI
extension NoticeController {
    private func setup() {
        
        types = [String](noticeDic.keys.sorted())
        selectedType = types[0]
        
        headerView = NoticeHeaderView(frame: CGRect(x: 0, y: 0, width: screen.width, height: 88.0))
        headerView.setTitle(text: selectedType)
        headerView.selectBtn.addTarget(self, action: #selector(selectType), for: .touchUpInside)
        headerView.backgroundColor = TNColor.mainColor
        view.addSubview(headerView)
        
        
        tableView = UITableView(frame: CGRect(x: 0, y: 88.0, width: screen.width, height: screen.height))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemGray5
        view.addSubview(tableView)
        
        
        
    }

    
    @objc private func selectType() {
        let alertsheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        for i in 0..<types.count {
            let action = UIAlertAction(title: types[i], style: .default) { (a) in
                self.selectedType = a.title!
                self.headerView.title.text = a.title!
                self.headerView.title.sizeToFit()
                self.tableView.reloadData()
            }
            alertsheet.addAction(action)
        }
        alertsheet.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        navigationController?.present(alertsheet, animated: true, completion: nil)
    }
    
    // 获取宽高
    public func getSuitableHeight(text: String, fontSize: CGFloat, fontWeight: UIFont.Weight, setWidth: CGFloat) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: setWidth, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        label.text = text

        label.sizeToFit()
        return label.bounds.height
    }
}

//MARK: - TableView Delegate
extension NoticeController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: 100, height: 30))
        label.text = "   3月18日"
        label.font = .systemFont(ofSize: 15)
        label.sizeToFit()
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeDic[selectedType]!.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let text = (noticeDic[selectedType]?[indexPath.row])!.more
        return 80 + getSuitableHeight(text: text!, fontSize: 40 / 3, fontWeight: .medium, setWidth: screen.width - 50)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "Notice.cell"
        tableView.register(NoticeCell.self, forCellReuseIdentifier: cellid)
        let cell: NoticeCell = tableView.dequeueReusableCell(withIdentifier: cellid) as! NoticeCell
        let notice:PlanModel = (noticeDic[selectedType]?[indexPath.row])!
        
        cell.backgroundColor = .systemGray5
        cell.backView.frame.size = CGSize(width: screen.width - 20, height: 80 + getSuitableHeight(text: notice.more!, fontSize: 40 / 3, fontWeight: .medium, setWidth: screen.width - 50))
        cell.title.text.text = notice.title
        cell.durTime.text.text = notice.startTime.timestampToDate(dateFormat: "MM月dd日") + "-" + notice.endTime.timestampToDate(dateFormat: "MM月dd日")
        cell.durTime.text.sizeToFit()
        cell.more.text = notice.more
        cell.more.sizeToFit()
        cell.creator.text = notice.creator
        let hr = Int(notice.posTime.timestampToDate(dateFormat: "H"))
        cell.posTime.text = hr! <= 12 ? "上午 " + String(describing: hr!) + notice.posTime.timestampToDate(dateFormat: ":mm") : "下午 " + String(describing: hr! - 12) + notice.posTime.timestampToDate(dateFormat: ":mm")
        
        return cell
    }
    
}
