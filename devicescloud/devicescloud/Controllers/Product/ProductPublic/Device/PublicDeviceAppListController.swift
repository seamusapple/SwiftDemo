//
//  PublicDeviceAppListController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/15.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class PublicDeviceAppListController: BaseController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        addPageViews()
        layoutPageViews()
        setPageViews()
    }
    
    // MARK: - Init Methods
    private init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    init(appList: [String], isCommon: Bool) {
        self.isCommon = isCommon
        self.appList = appList
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Controller Settings
    private func setNavigationBar() {
        setNaviBar(type: .normal)
        guard isCommon != nil else {
            isCommon = true
            return
        }
        if isCommon! {
            setNaviBar(title: TextStr.appListTitle[0])
        } else {
            setNaviBar(title: TextStr.appListTitle[1])
        }
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
        tableView.estimatedRowHeight = CGFloat(45)
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - Event Responses
    
    // MARK: - Private Methods
    
    // MARK: - Controller Attributes
    fileprivate var tableView_: UITableView?

    fileprivate var isCommon: Bool?
    fileprivate var appList: [String]?
}

// MARK: - Getters and Setters
extension PublicDeviceAppListController {
    fileprivate var tableView: UITableView {
        if tableView_ == nil {
            tableView_ = UITableView(frame: CGRect.zero, style: .grouped)
            tableView_?.allowsSelection = true
            tableView_?.separatorStyle = .none
            tableView_?.showsVerticalScrollIndicator = false
            tableView_?.backgroundColor = Color.hexf5f6f8
            tableView_?.register(ProductAppAndDataCell.self, forCellReuseIdentifier: String(describing: ProductAppAndDataCell.self))
            
            return tableView_!
        }
        
        return tableView_!
    }
}

//MARK: - Data Source and Delegate
extension PublicDeviceAppListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard appList?.count != 0 else {
            return 0
        }
        return (appList?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductAppAndDataCell.self), for: indexPath) as! ProductAppAndDataCell
        cell.appAndDataName.text = appList?[indexPath.row]
        
        guard appList?.count != 0 else {
            return cell
        }
        
        if indexPath.row == (appList?.count)! - 1 {
            cell.seperatorBottom.isHidden = false
            cell.seperator.isHidden = true
        }
        
        return cell
    }
}

extension PublicDeviceAppListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(10)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = BlankHeaderView()
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let appDetailVC = PublicDeviceAppDetailController()
        navigationController?.pushViewController(appDetailVC, animated: true)
    }
}
