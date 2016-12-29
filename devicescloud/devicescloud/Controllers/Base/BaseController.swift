//
//  BaseController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/1.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

enum NaviType {
    case normal // 左边带有返回键(默认蓝色)
    case search // 搜索框
    case text   // 左边无返回键的
    case blank  // 无边界线
}

enum BackColor {
    case blue   // 返回键蓝色
    case white  // 返回键白色
}

enum ActionType {
    case pop
    case dismiss
}

enum SearchType {
    case product
    case notification
    case application
}

enum buttonType {
    case search
    case share
}

class BaseController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        setBaseConditions()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Controller Settings
    private func setBaseConditions() {
        view.backgroundColor = Color.hexwhite
        
        navigationController?.navigationBar.isTranslucent = false // 关闭导航栏半透明效果
        
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        setBorderColor()
        
        setNaviBar(type: .normal)   // 默认normal
    }
    
    // MARK: - Public Methods
    /**
     *
     *  设置当前 Navigation Bar 背景色
     *
     */
    public func setNaviBarBackground(color: UIColor) {
        navigationController?.navigationBar.barTintColor = color
    }
    
    /**
     *
     *  设置当前 Navigation 标题
     *
     */
    public func setNaviBar(title: String) {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        titleLabel.text = title
        titleLabel.font = Font.boldSize18
        titleLabel.textColor = Color.hex333333
        titleLabel.textAlignment = .center
        navigationItem.titleView = titleLabel
    }
    
    /**
     - description: 设置当前 Navigation 样式
     - parameter type: navigationBar的样式
     - type:
     
        - .normal:
                
                默认normal，有返回键
        
        - .search:
                
                无返回键
     
                需实现setSearchController(type:, searchController:)方法
     
        - .text: 
                
                无返回键
     
                可实现setNaviRightTextBtn(text:, action:)方法
     
                可实现setNaviRightBtn(type:, action:)方法
     
                可实现setNaviTextBtn(leftText:, actionType:, rightText:, rightAction:)方法
     
        - .blank:
                无返回键，无下划线

     */
    public func setNaviBar(type: NaviType) {
        switch type {
            
        case .normal:
            removeBarItem()
            setBackBtn(color: .blue, action: .pop)
        
        case .search:
            removeBarItem()
            
        case .text:
            removeBarItem()
            
        case .blank:
            removeBarItem()
            hideShadowImage()
        }
    }

    /**
     *
     *  设置当前 Navigation 返回按钮
     *
     *  style: .blue / .white 蓝色／白色样式可选, 默认蓝色
     *
     */
    func setBackBtn(color: BackColor, action: ActionType) {
        let icon: UIImage
        let barBtnItem: UIBarButtonItem
        
        switch color {
            
        case .blue:
            icon = UIImage(named: Icon.back)!
        
        case .white:
            icon = UIImage(named: Icon.backWhite)!
        }
        
        switch action {
        
        case .pop:
            barBtnItem = UIBarButtonItem(image: icon.withRenderingMode(.alwaysOriginal),
                                         style: .plain, target: self, action: #selector(pop))
            
        case .dismiss:
            barBtnItem = UIBarButtonItem(image: icon.withRenderingMode(.alwaysOriginal),
                                         style: .plain, target: self, action: #selector(viewDismiss))

        }
        
        navigationItem.leftBarButtonItem = barBtnItem
    }
    
    /**
     *
     *  设置当前 Navigation 右侧按钮
     *
     *  type: 按钮类型
     *  action: 点击事件
     *
     */
    func setNaviRightBtn(type: buttonType, action: Selector) {
        var icon: UIImage?
        
        switch type {
            
        case .search:
            icon = UIImage(named: Icon.searchBlue)
        
        case .share:
            icon = UIImage(named: Icon.share)
        }
        
        let barBtnItem = UIBarButtonItem(image: icon!.withRenderingMode(.alwaysOriginal),
                                         style: .plain, target: self, action: action)
        navigationItem.rightBarButtonItem = barBtnItem
    }
    
    /**
     *
     *  设置当前 Navigation 右侧文字按钮
     *
     *  action: 点击事件
     *
     */
    func setNaviRightTextBtn(text: String, action: Selector) {
        let barBtnItem = UIBarButtonItem(title: text, style: .plain, target: self, action: action)
        setEnableColor(item: barBtnItem)
        setDisableColor(item: barBtnItem)
        navigationItem.rightBarButtonItem = barBtnItem
    }
    
    /**
     *
     *  设置当前 Navigation 左侧和右侧文字按钮
     *  leftText: 左侧文字
     *  leftAction: 左侧点击事件
     *  rightText: 右侧文字
     *  rightAction: 右侧点击事件
     *
     */
    func setNaviTextBtn(leftText: String, actionType: ActionType, rightText: String, rightAction: Selector) {
        let leftAction: Selector
        
        switch actionType {
            
        case .pop:
            
            leftAction = #selector(pop)
            
        case .dismiss:
            leftAction = #selector(viewDismiss)
        }
        
        let leftBarBtnItem = UIBarButtonItem(title: leftText, style: .plain, target: self, action: leftAction)
        setEnableColor(item: leftBarBtnItem)
        setDisableColor(item: leftBarBtnItem)
        navigationItem.leftBarButtonItem = leftBarBtnItem
        
        let rightBarBtnItem = UIBarButtonItem(title: rightText, style: .plain, target: self, action: rightAction)
        setEnableColor(item: rightBarBtnItem)
        setDisableColor(item: rightBarBtnItem)
        rightBarBtnItem.isEnabled = false
        navigationItem.rightBarButtonItem = rightBarBtnItem
    }
    
    /**
     *
     *  设置当前 Navigation searchBar
     *
     *  searchType: 搜索框类型
     *  searchController: 搜索控制器
     *
     */
    func setSearchController(type: SearchType, searchController: UISearchController) {
        
        switch type {
            
        case .product:
            setSearchBar(title: TextStr.searchProductTitle, controller: searchController)
            
        case .notification:
            setSearchBar(title: TextStr.searchNotificationTitle, controller: searchController)
            
        case .application:
            setSearchBar(title: TextStr.searchApplicationTitle, controller: searchController)
        }
        
        navigationItem.titleView = searchController.searchBar
    }
    
    @objc func viewDismiss() {
        if let topViewController = UIApplication.topViewController() {
            topViewController.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - Private Methods
    @objc private func pop() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    //移除所有item
    private func removeBarItem() {
        navigationItem.leftBarButtonItem = nil
        navigationItem.rightBarButtonItem = nil
    }
    
    //设置item普通状态
    private func setEnableColor(item: UIBarButtonItem) {
        var attrs = [String: AnyObject]()
        attrs[NSFontAttributeName] = Font.boldSize15
        attrs[NSForegroundColorAttributeName] = Color.hex19bbff
        item.setTitleTextAttributes(attrs, for: .normal)
    }
    
    //设置item不可用状态
    private func setDisableColor(item: UIBarButtonItem) {
        var attrs = [String: AnyObject]()
        attrs[NSFontAttributeName] = Font.boldSize15
        attrs[NSForegroundColorAttributeName] = Color.hex999999
        item.setTitleTextAttributes(attrs, for: .disabled)
    }
    
    private func setSearchBar(title: String, controller: UISearchController) {
        let searchField = controller.searchBar.value(forKey: "searchField")
        if let textField = searchField as? UITextField {
            textField.backgroundColor = Color.hexf5f6f8
            textField.layer.borderColor = Color.hexe2e3e5.cgColor
            textField.layer.borderWidth = CGFloat(1 / Size.screenScale)
            textField.layer.cornerRadius = CGFloat(5)
            textField.layer.masksToBounds = true
            textField.textAlignment = .left
            textField.textColor = Color.hex333333
            textField.font = Font.size14
            
            let textFieldLabel = textField.value(forKey: "placeholderLabel")
            if let label = textFieldLabel as? UILabel {
                label.textColor = Color.hexcccccc
                label.font = Font.size14
            }
        }
        
        controller.searchBar.placeholder = title
        controller.searchBar.tintColor = Color.hex19bbff
        controller.searchBar.setValue(TextStr.searchCancle, forKey: "_cancelButtonText")
        controller.searchBar.setCancelButton(font: Font.boldSize15)
        controller.searchBar.setImage(UIImage(named: Icon.search), for: .search, state: .normal)
        controller.searchBar.sizeToFit()
        controller.dimsBackgroundDuringPresentation = false
        controller.searchBar.barStyle = .default
    }
    
    private func hideShadowImage() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func setBorderColor() {
        navigationController?.navigationBar.setBackgroundImage(UIImage.forBar(color: Color.hexwhite), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage.forBar(color: Color.hexd4d6d8)
    }
}
