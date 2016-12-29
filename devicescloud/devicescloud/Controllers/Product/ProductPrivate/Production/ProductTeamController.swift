//
//  ProductTeamController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/13.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ProductTeamController: UITableViewController {

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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Controller Settings
    private func setPageViews() {
        tableView.allowsSelection = false
        tableView.backgroundColor = Color.hexf5f6f8
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = CGFloat(35)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.showsVerticalScrollIndicator = false
        tableView.register(ProductTeamCell.self, forCellReuseIdentifier: String(describing: ProductTeamCell.self))
    }
    
    // MARK: - Event Responses
    
    // MARK: - Private Methods
    
    // MARK: - Controller Attributes
    let logo = ["s_03", "s_06", "s_08", "s_10"]
    let name = ["沃斯丞蓄怨", "哒不思嘚笑强", "天圣我踩庇佑咏", "天亮了酷爱行行"]
    let charactor = ["管理员", "开发者", "运维师", "观察者"]
}

// MARK: - TableView DataSource and Delegate
extension ProductTeamController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductTeamCell.self), for: indexPath) as! ProductTeamCell
        cell.memberLogo.image = UIImage(named: logo[indexPath.row])
        cell.memberName.text = name[indexPath.row]
        cell.memberCharacter.text = charactor[indexPath.row]
        
        if indexPath.row == 3 {
            cell.seperatorBottom.isHidden = false
            cell.seperator.isHidden = true
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Push Next Controller
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(10)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = BlankHeaderView()
        return header
    }
}
