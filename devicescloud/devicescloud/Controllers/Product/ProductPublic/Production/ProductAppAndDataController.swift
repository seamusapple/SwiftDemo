//
//  ProductAppAndDataController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/13.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ProductAppAndDataController: UITableViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPageViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Init Methods
    private init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    init(appAndDataInfo: [String], publicType: publicType) {
        self.appAndDataInfo = appAndDataInfo
        self.publicType = publicType
        
        super.init(style: .grouped)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Controller Settings
    private func setPageViews() {
        tableView.allowsSelection = true
        tableView.backgroundColor = Color.hexf5f6f8
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = CGFloat(45)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.showsVerticalScrollIndicator = false
        tableView.register(ProductAppAndDataCell.self, forCellReuseIdentifier: String(describing: ProductAppAndDataCell.self))
    }
    
    // MARK: - Event Responses
    
    // MARK: - Private Methods
    
    // MARK: - Controller Attributes
    fileprivate var appAndDataInfo: [String]?
    fileprivate var publicType: publicType?
}

// MARK: - TableView DataSource and Delegate
extension ProductAppAndDataController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard appAndDataInfo?.count != 0 else {
            return 0
        }
        return (appAndDataInfo?.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductAppAndDataCell.self), for: indexPath) as! ProductAppAndDataCell
        cell.appAndDataName.text = appAndDataInfo?[indexPath.row]
        
        guard appAndDataInfo?.count != 0 else {
            return cell
        }
        
        if indexPath.row == (appAndDataInfo?.count)! - 1 {
            cell.seperatorBottom.isHidden = false
            cell.seperator.isHidden = true
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch publicType! {
        case .normal:
            if indexPath.row == 0 {
                let appList = ["应用名称", "应用名称", "应用名称", "应用名称", "应用名称", "应用名称", "应用名称"]
                let appListVC = PublicDeviceAppListController(appList: appList, isCommon: true)
                navigationController?.pushViewController(appListVC, animated: true)
            } else if indexPath.row == 1 {
                let appList = ["应用名称", "应用名称", "应用名称", "应用名称"]
                let appListVC = PublicDeviceAppListController(appList: appList, isCommon: false)
                navigationController?.pushViewController(appListVC, animated: true)
            }
        
        case .common:
            let appListVC = PublicDeviceAppDetailController()
            navigationController?.pushViewController(appListVC, animated: true)
            
        case .indepent:
            let appListVC = PublicDeviceAppDetailController()
            navigationController?.pushViewController(appListVC, animated: true)
            
        case .data:
            let appDetailVC = PublicDeviceDataDeviceController()
            navigationController?.pushViewController(appDetailVC, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(10)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = BlankHeaderView()
        return header
    }
}
