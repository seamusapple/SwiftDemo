//
//  DiscoveryConstructorHeaderView.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/21.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class DiscoveryConstructorHeaderView: UIView {

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
        addSubview(avatar)
        addSubview(name)
        addSubview(descriptionAuthor)
        addSubview(seperator)
        addSubview(blank)
    }
    
    private func layoutPageViews() {
        avatar.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.top.equalTo(self).offset(15)
            ConstraintMaker.bottom.equalTo(seperator.snp.top).offset(-15)
            ConstraintMaker.right.equalTo(name.snp.left).offset(-15)
            ConstraintMaker.size.equalTo(CGSize(width: 65, height: 65))
        }
        
        name.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(avatar.snp.right).offset(15)
            ConstraintMaker.top.equalTo(self).offset(27)
            ConstraintMaker.bottom.equalTo(descriptionAuthor.snp.top).offset(-12)
        }
        
        descriptionAuthor.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(name)
            ConstraintMaker.top.equalTo(name.snp.bottom).offset(12)
        }
        
        seperator.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalTo(self)
            ConstraintMaker.top.equalTo(avatar.snp.bottom).offset(15)
            ConstraintMaker.bottom.equalTo(blank.snp.top)
            ConstraintMaker.height.equalTo(1 / Size.screenScale)
        }
        
        blank.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(seperator.snp.bottom)
            ConstraintMaker.left.right.bottom.equalTo(self)
        }
    }
    
    func setPageViews() {
        backgroundColor = Color.hexwhite
    }
    
    // MARK: - Controller Attributes
    fileprivate var avatar_: UIImageView?
    fileprivate var name_: UILabel?
    fileprivate var descriptionAuthor_: UILabel?
    fileprivate var seperator_: UIView?
    fileprivate var blank_: BlankHeaderView?
}

// MARK: - Getters and Setters
extension DiscoveryConstructorHeaderView {
    var avatar: UIImageView {
        if avatar_ == nil {
            avatar_ = UIImageView()
            avatar_?.layer.cornerRadius = CGFloat(32.5)
            avatar_?.layer.masksToBounds = true
            avatar_?.layer.borderWidth = 1 / Size.screenScale
            avatar_?.layer.borderColor = Color.hexcecece.cgColor
            
            return avatar_!
        }
        
        return avatar_!
    }
    
    var name: UILabel {
        if name_ == nil {
            name_ = UILabel()
            name_?.textColor = Color.hex333333
            name_?.textAlignment = .left
            name_?.font = Font.size16
            
            return name_!
        }
        
        return name_!
    }
    
    var descriptionAuthor: UILabel {
        if descriptionAuthor_ == nil {
            descriptionAuthor_ = UILabel()
            descriptionAuthor_?.textColor = Color.hex666666
            descriptionAuthor_?.textAlignment = .left
            descriptionAuthor_?.font = Font.size14
            
            return descriptionAuthor_!
        }
        
        return descriptionAuthor_!
    }
    
    fileprivate var seperator: UIView {
        if seperator_ == nil {
            seperator_ = UIView()
            seperator_?.backgroundColor = Color.hexe2e3e5
            
            return seperator_!
        }
        
        return seperator_!
    }
    
    fileprivate var blank: BlankHeaderView {
        if blank_ == nil {
            blank_ = BlankHeaderView()
            
            return blank_!
        }
        
        return blank_!
    }
}
