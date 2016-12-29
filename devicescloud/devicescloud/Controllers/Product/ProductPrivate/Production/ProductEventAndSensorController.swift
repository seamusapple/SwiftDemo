//
//  ProductEventAndSensorController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/13.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ProductEventAndSensorController: UITableViewController {

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
    
    init(eventAndSensorInfo: [[String]], isEvent: Bool) {
        self.eventAndSensorInfo = eventAndSensorInfo
        self.isEvent = isEvent
        
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
        tableView.register(ProductEventAndSensorCell.self, forCellReuseIdentifier: String(describing: ProductEventAndSensorCell.self))
    }
    
    // MARK: - Event Responses
    
    // MARK: - Private Methods
    
    // MARK: - Controller Attributes
    var eventAndSensorInfo: [[String]]?
    var isEvent: Bool?
}

// MARK: - TableView DataSource and Delegate
extension ProductEventAndSensorController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard eventAndSensorInfo?[0].count != 0 else {
            return 0
        }
        return (eventAndSensorInfo![0].count)

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductEventAndSensorCell.self), for: indexPath) as! ProductEventAndSensorCell
        cell.nameLabel.text = eventAndSensorInfo?[0][indexPath.row]
        cell.timeLabel.text = eventAndSensorInfo?[1][indexPath.row]
        if indexPath.row == 0 || indexPath.row == 3 {
            cell.unread.isHidden = false
        }
        
        guard eventAndSensorInfo?.count != 0 else {
            return cell
        }
        
        if indexPath.row == (eventAndSensorInfo![0].count) - 1 {
            cell.seperatorBottom.isHidden = false
            cell.seperator.isHidden = true
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard isEvent != nil else {
            isEvent = true
            return
        }
        if isEvent! {
            let eventDetailVC = PrivateEventDetailController()
            navigationController?.pushViewController(eventDetailVC, animated: true)
        } else {
            let sensorDetailVC = PrivateSensorDetailController()
            navigationController?.pushViewController(sensorDetailVC, animated: true)
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
