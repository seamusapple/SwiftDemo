//
//  DiscoveryHomeController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/1.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class DiscoveryHomeController: BaseController {
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
    func setNavigationBar() {
        setNaviBar(type: .search)
        setNaviBar(title: TextStr.discovery)
        setNaviRightBtn(type: .search, action: #selector(DiscoveryHomeController.goSearch))
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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = CGFloat(69)
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - Event Responses
    @objc fileprivate func goSearch() {
        let searchController = SearchController(searchType: .application)
        let searchNav = UINavigationController(rootViewController: searchController)
        searchNav.transitioningDelegate = self
        present(searchNav, animated: true) {
            searchController.searchController.isActive = true
        }
    }
    
    // MARK: - Private Methods
    
    // MARK: - Controller Attributes
    fileprivate var tableView_: UITableView?
}

// MARK: - Getters and Setters
extension DiscoveryHomeController {
    fileprivate var tableView: UITableView {
        if tableView_ == nil {
            tableView_ = UITableView()
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

// MARK: - UITableView DataSource and Delegate
extension DiscoveryHomeController: UITableViewDataSource {
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

extension DiscoveryHomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DiscoveryAppDetailController()
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - UIViewControllerTransitioningDelegate
extension DiscoveryHomeController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
}
