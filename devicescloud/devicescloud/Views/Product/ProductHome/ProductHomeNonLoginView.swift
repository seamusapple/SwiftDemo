//
//  ProductHomeNonLoginView.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/23.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ProductHomeNonLoginView: UIView {

    // MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addPageViews()
        layoutPageViews()
        setPageViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Settings
    private func addPageViews() {
        addSubview(onenetIcon)
        addSubview(loginButton)
        addSubview(loginTextOne)
        addSubview(loginTextTwo)
    }
    
    private func layoutPageViews() {
        onenetIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(self).offset(CGFloat(145))
            ConstraintMaker.centerX.equalTo(self)
            ConstraintMaker.size.equalTo(CGSize(width: CGFloat(115), height: CGFloat(72)))
        }
        
        loginTextOne.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(onenetIcon.snp.bottom).offset(30)
            ConstraintMaker.centerX.equalTo(onenetIcon)
            ConstraintMaker.bottom.equalTo(loginTextTwo.snp.top).offset(-7)
        }
        
        loginTextTwo.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(loginTextOne.snp.bottom).offset(7)
            ConstraintMaker.centerX.equalTo(onenetIcon)
            ConstraintMaker.bottom.equalTo(loginButton.snp.top).offset(-25)
        }
        
        loginButton.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(loginTextTwo.snp.bottom).offset(25)
            ConstraintMaker.centerX.equalTo(onenetIcon)
            ConstraintMaker.size.equalTo(CGSize(width: CGFloat(115), height: CGFloat(40)))
        }
    }
    
    private func setPageViews() {
        backgroundColor = Color.hexf5f6f8
    }
    
    // MARK: - Controller Attributes
    fileprivate var onenetIcon_: UIImageView?
    fileprivate var loginButton_: UIButton?
    fileprivate var loginTextOne_: UILabel?
    fileprivate var loginTextTwo_: UILabel?

}

// MARK: - Getters and Setters
extension ProductHomeNonLoginView {
    fileprivate var onenetIcon: UIImageView {
        if onenetIcon_ == nil {
            onenetIcon_ = UIImageView()
            onenetIcon_?.image = UIImage(named: Icon.productHomeNonLogin)
            
            return onenetIcon_!
        }
        
        return onenetIcon_!
    }
    
    fileprivate var loginTextOne: UILabel {
        if loginTextOne_ == nil {
            loginTextOne_ = UILabel()
            loginTextOne_?.textAlignment = .center
            loginTextOne_?.textColor = Color.hexcccccc
            loginTextOne_?.font = Font.size15
            loginTextOne_?.text = TextStr.productHomeNonLogin
            
            return loginTextOne_!
        }
        
        return loginTextOne_!
    }
    
    fileprivate var loginTextTwo: UILabel {
        if loginTextTwo_ == nil {
            loginTextTwo_ = UILabel()
            loginTextTwo_?.textAlignment = .center
            loginTextTwo_?.textColor = Color.hexcccccc
            loginTextTwo_?.font = Font.size15
            loginTextTwo_?.text = TextStr.productHomePleaseLogin
            
            return loginTextTwo_!
        }
        
        return loginTextTwo_!
    }
    
    var loginButton: UIButton {
        if loginButton_ == nil {
            loginButton_ = UIButton()
            loginButton_?.layer.cornerRadius = CGFloat(5)
            loginButton_?.layer.masksToBounds = true
            loginButton_?.layer.borderWidth = CGFloat(1 / Size.screenScale)
            loginButton_?.layer.borderColor = Color.hexcecece.cgColor
            loginButton_?.titleLabel?.font = Font.size18
            loginButton_?.setTitle(TextStr.login, for: .normal)
            loginButton_?.setTitleColor(Color.hex19bbff, for: .normal)
            
            return loginButton_!
        }
        
        return loginButton_!
    }
}
