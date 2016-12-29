//
//  ProductTriggerDetailController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/15.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ProductTriggerDetailController: BaseController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        addPageViews()
        layoutPageViews()
        setPageViews()
    }
    
    // MARK: - Init Methods
    
    // MARK: - Controller Settings
    private func setNavigationBar() {
        setNaviBar(type: .normal)
        setNaviBar(title: "触发器名称")
    }
    
    private func addPageViews() {
        view.addSubview(tableView)
    }
    
    private func layoutPageViews() {
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalTo(view)
        }
    }
    
    private func setPageViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = CGFloat(85)
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - Event Responses
    
    // MARK: - Private Methods
    
    // MARK: - Controller Attributes
    fileprivate var tableView_: UITableView?
}

// MARK: - Getters and Setters
extension ProductTriggerDetailController {
    fileprivate var tableView: UITableView {
        if tableView_ == nil {
            tableView_ = UITableView(frame: CGRect.zero, style: .grouped)
            tableView_?.allowsSelection = false
            tableView_?.backgroundColor = Color.hexf5f6f8
            tableView_?.separatorStyle = .none
            tableView_?.showsVerticalScrollIndicator = false
            tableView_?.register(NotificaitonEventCell.self, forCellReuseIdentifier: String(describing: NotificaitonEventCell.self))
            
            return tableView_!
        }
        
        return tableView_!
    }
}

// MARK: - Data Source and Delegate
extension ProductTriggerDetailController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NotificaitonEventCell.self), for: indexPath) as! NotificaitonEventCell
        let data = [
            ["警告", "调试", "错误", "信息", "保留", "自定义"],
            ["手柄", "显示器", "电脑", "温度计", "加湿器", "电饭锅"],
            ["1", "2", "3", "4", "5", "6"],
            ["23", "13", "24", "25", "45", "53"],
            ["21:53", "17:35", "昨天", "2016/11/22", "2016/11/20", "2016/10/24"]
        ]
        cell.mark = data[0][indexPath.row]
        cell.name = data[1][indexPath.row]
        cell.level = data[2][indexPath.row]
        cell.value = data[3][indexPath.row]
        cell.time = data[4][indexPath.row]
        
        if indexPath.row == 5 {
            cell.seperatorBottom.isHidden = false
            cell.seperator.isHidden = true
        }
        
        return cell
    }
}

extension ProductTriggerDetailController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(10)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = BlankHeaderView()
        return header
    }
}
