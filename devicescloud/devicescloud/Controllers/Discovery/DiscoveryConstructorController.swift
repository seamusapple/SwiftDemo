//
//  DiscoveryConstructorController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/21.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class DiscoveryConstructorController: BaseController {

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
        tableView.estimatedRowHeight = CGFloat(69)
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - Event Responses
    
    // MARK: - Private Methods
    
    // MARK: - Controller Attributes
    fileprivate var tableView_: UITableView?
}

// MARK: - Getters and Setters
extension DiscoveryConstructorController {
    fileprivate var tableView: UITableView {
        if tableView_ == nil {
            tableView_ = UITableView(frame: CGRect.zero, style: .grouped)
            tableView_?.allowsSelection = true
            tableView_?.backgroundColor = Color.hexf5f6f8
            tableView_?.separatorStyle = .none
            tableView_?.showsVerticalScrollIndicator = false
            tableView_?.register(DiscoveryHomeCell.self, forCellReuseIdentifier: String(describing: DiscoveryHomeCell.self))

            return tableView_!
        }
        
        return tableView_!
    }
}

// MARK: - UITableView Delegate and DataSource 
extension DiscoveryConstructorController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DiscoveryHomeCell.self), for: indexPath
            ) as! DiscoveryHomeCell
        let data = [
            ["公司红外热释监控", "中水八局液位实时监测", "黄缘闭壳龟救护中心", "浉河区公益性水库检测", "千工堰村白鹤湾水库", "湿温度检测", "黄连沟水库", "大悦城环境监测系统"],
            ["总部大楼测试", "qhkj_IOT001", "qhkj_IOT001", "OneNET", "OneNET", "OneNET", "OneNET", "xiaofan"],
            ["32", "17", "32", "32", "32", "32", "32", "14"],
            ["8", "18", "8", "8", "8", "8", "9", "23"]
        ]
        cell.productName.text = data[0][indexPath.row]
        cell.constructor.text = data[1][indexPath.row]
        cell.likeView.image = UIImage(named: Icon.like)
        cell.likeNum.text = data[2][indexPath.row]
        cell.commentNum.text = data[3][indexPath.row]
        
        if indexPath.row == 0 || indexPath.row == 3 {
            cell.likeView.image = UIImage(named: Icon.likeOn)
        }
        
        if indexPath.row == 7 {
            cell.seperatorBottom.isHidden = false
            cell.seperator.isHidden = true
        }
        return cell
    }
}

extension DiscoveryConstructorController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DiscoveryAppDetailController()
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(105)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = DiscoveryConstructorHeaderView()
        header.name.text = "OneNET"
        header.descriptionAuthor.text = "资深创客，在平台上有N多种的设备尝试。"
        header.avatar.image = UIImage(named: "s_03")
        return header
    }
}
