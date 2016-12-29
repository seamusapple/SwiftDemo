//
//  ProductHomeController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/1.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ProductHomeController: BaseController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        addPageViews()
        layoutPageViews()
        setPageViews()
    }
    
    // MARK: - Controller Settings
    private func setNavigationBar() {
        setNaviBar(title: TextStr.product)
        setNaviBar(type: .search)
        setNaviRightBtn(type: .search, action: #selector(ProductHomeController.goSearch))
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
    }
    
    // MARK: - Event Responses
    @objc fileprivate func gotoProductDetail(sender: UIButton) {
        let productDetailVC = ProductDetailController()
        navigationController?.pushViewController(productDetailVC, animated: true)
    }
    
    @objc fileprivate func gotoProduct(sender: UIButton) {
        let index = sender.tag % 100
        let indexPathRow = sender.tag / 100 
//        let productVC = ProductController(index: index, productInfo: indexPathRow)
        let cs = [productType.publicProduct, .privateProduct, .publicProduct]
        let productVC = ProductController(index: index, protocolType: cs[indexPathRow])
        navigationController?.pushViewController(productVC, animated: true)
    }
    
    @objc fileprivate func goSearch() {
        let searchController = SearchController(searchType: .product)
        let searchNav = UINavigationController(rootViewController: searchController)
        searchNav.transitioningDelegate = self
        present(searchNav, animated: true) { 
            searchController.searchController.isActive = true
        }
    }
    
    // MARK: - Private Methods
    
    // MARK: - Controller Attributes
    fileprivate var tableView_: UITableView?

    fileprivate var isLogin = false
    fileprivate let name = [[TextStr.productApplication, TextStr.productEvent, TextStr.productApplication],
                            [TextStr.productData, TextStr.productSensor, TextStr.productData],
                            [TextStr.productTriger, TextStr.productTeam, TextStr.productTriger]]
    fileprivate var icon = [[Icon.productApplication, Icon.productEvent, Icon.productApplication],
                            [Icon.productData, Icon.productSensor, Icon.productData],
                            [Icon.productTriger, Icon.productTeam, Icon.productTriger]]
    fileprivate var protocolType = ["HTTP", "RGMB", "HTTP"]
}

// MARK: - Getters and Setters
extension ProductHomeController {
    fileprivate var tableView: UITableView {
        if tableView_ == nil {
            tableView_ = UITableView()
            tableView_?.allowsSelection = false
            tableView_?.separatorStyle = .none
            tableView_?.showsVerticalScrollIndicator = false
            tableView_?.backgroundColor = Color.hexf5f6f8
            tableView_?.register(ProductHomeCell.self, forCellReuseIdentifier: String(describing: ProductHomeCell.self))
            
            return tableView_!
        }
    
        return tableView_!
    }
}

// MARK: - Data Source and Delegate
extension ProductHomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductHomeCell.self), for: indexPath) as! ProductHomeCell
        cell.protocolType.text = protocolType[indexPath.row]
        cell.mainTwo.mainIcon.image = UIImage(named: icon[0][indexPath.row])
        cell.mainThree.mainIcon.image = UIImage(named: icon[1][indexPath.row])
        cell.mainFour.mainIcon.image = UIImage(named: icon[2][indexPath.row])
        cell.mainTwo.mainName.text = name[0][indexPath.row]
        cell.mainThree.mainName.text = name[1][indexPath.row]
        cell.mainFour.mainName.text = name[2][indexPath.row]
        cell.mainOne.mainNum.text = "123"
        cell.mainTwo.mainNum.text = "134"
        cell.mainThree.mainNum.text = "135"
        cell.mainFour.mainNum.text = "136"
        cell.detail.push.tag = indexPath.row
        cell.mainOne.mainButton.tag = indexPath.row * 100
        cell.mainTwo.mainButton.tag = indexPath.row * 100 + 1
        cell.mainThree.mainButton.tag = indexPath.row * 100 + 2
        cell.mainFour.mainButton.tag = indexPath.row * 100 + 3
        cell.detail.push.addTarget(self, action: #selector(gotoProductDetail(sender:)), for: .touchUpInside)
        cell.mainOne.mainButton.addTarget(self, action: #selector(gotoProduct(sender:)), for: .touchUpInside)
        cell.mainTwo.mainButton.addTarget(self, action: #selector(gotoProduct(sender:)), for: .touchUpInside)
        cell.mainThree.mainButton.addTarget(self, action: #selector(gotoProduct(sender:)), for: .touchUpInside)
        cell.mainFour.mainButton.addTarget(self, action: #selector(gotoProduct(sender:)), for: .touchUpInside)
        
        return cell
    }
}

extension ProductHomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

// MARK: - UIViewControllerTransitioningDelegate
extension ProductHomeController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
}
