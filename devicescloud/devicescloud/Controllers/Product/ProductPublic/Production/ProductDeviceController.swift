//
//  ProductDeviceController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/13.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ProductDeviceController: UITableViewController {
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
    
    init( protocolType: productType) {
        super.init(style: .grouped)
        
        self.proType = protocolType
    }
    
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
        tableView.register(ProductDeviceCell.self, forCellReuseIdentifier: String(describing: ProductDeviceCell.self))
    }
    
    // MARK: - Event Responses
    
    // MARK: - Private Methods
    
    // MARK: - Controller Attributes
    fileprivate var proType: productType?
}

// MARK: - TableView DataSource and Delegate
extension ProductDeviceController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductDeviceCell.self), for: indexPath) as! ProductDeviceCell
        cell.deviceImage.image = UIImage(named: "img_03")
        cell.deviceName.text = "设备名称"
        cell.deviceID.text = "设备ID: 3782726"
        if indexPath.row == 3 {
            cell.seperatorBottom.isHidden = false
            cell.seperator.isHidden = true
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let deviceVC = ProductDeviceDetailHomeController(index: 0, protocolType: proType!)
        navigationController?.pushViewController(deviceVC, animated: true)
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(10)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = BlankHeaderView()
        return header
    }
}
