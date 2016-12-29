//
//  ProductTriggerController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/13.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ProductTriggerController: UITableViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPageViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Init Methods
    init() {
        super.init(style: .grouped)
    }
    
//    init(triggerInfo: [String]) {
//        self.triggerInfo = triggerInfo
//        
//        super.init(nibName: nil, bundle: nil)
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Controller Settings
    private func setPageViews() {
        tableView.allowsSelection = true
        tableView.backgroundColor = Color.hexf5f6f8
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = CGFloat(85)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.showsVerticalScrollIndicator = false
        tableView.register(ProductTriggerCell.self, forCellReuseIdentifier: String(describing: ProductTriggerCell.self))
    }
    
    // MARK: - Event Responses
    
    // MARK: - Private Methods
    
    // MARK: - Controller Attributes
//    var triggerInfo: [String]?
}

// MARK: - TableView DataSource and Delegate
extension ProductTriggerController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductTriggerCell.self), for: indexPath) as! ProductTriggerCell
        cell.triggerName.text = "触发器名称"
        cell.dataName.text = "数据流名称：最高温度"
        cell.deviceArea.text = "设备范围：全部设备"
        
        if indexPath.row == 2 {
            cell.seperatorBottom.isHidden = false
            cell.seperator.isHidden = true
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let triggerDetailVC = ProductTriggerDetailController()
        navigationController?.pushViewController(triggerDetailVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = BlankHeaderView()
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(10)
    }
}
