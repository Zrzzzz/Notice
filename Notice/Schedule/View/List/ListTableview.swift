//
//  ListTableview.swift
//  Notice
//
//  Created by 王申宇 on 31/03/2020.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import UIKit

class ListTableView: UITableView {
    
    var handle: UILabel!
    var listHeader: ListHeader!
    var header: UIView!
        
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.layer.cornerRadius = 10
        self.register(ListCell.self, forCellReuseIdentifier: "listcell")
        initView()
    }
    
    private func initView() {
        self.separatorStyle = .none
        header = UIView()
        header.frame = CGRect(x: 0, y: 0, width: screen.width, height: 22)
        self.tableHeaderView = header
        handle = UILabel()
        handle.backgroundColor = TNColor.listHandle
        handle.layer.cornerRadius = 10 / 3
        handle.layer.masksToBounds = true
        header.addSubview(handle)
        handle.snp.makeConstraints { make in
            make.top.equalTo(self).offset(20 / 3)
            make.centerX.equalTo(self)
            make.width.equalTo(383 / 3)
            make.height.equalTo(20 / 3)
        }
        
        listHeader = ListHeader()
        
//        setEditing(true, animated: false)
//        allowsMultipleSelection = false
//        allowsSelectionDuringEditing = false
//        allowsMultipleSelectionDuringEditing = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ScheduleController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listcell") as! ListCell
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.tableView.listHeader
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .delete
//    }
    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        
//    }
}
