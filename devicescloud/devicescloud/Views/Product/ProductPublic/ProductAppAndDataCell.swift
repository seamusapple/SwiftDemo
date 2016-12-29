//
//  ProductAppAndDataCell.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/14.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ProductAppAndDataCell: UITableViewCell {

    // MARK: - Init Methods
    override init(style: UITableViewCellStyle, reuseIdentifier: String!)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addCellViews()
        layoutCellViews()
        setCellViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Settings
    private func addCellViews() {
        contentView.addSubview(appAndDataName)
        contentView.addSubview(nextIcon)
        contentView.addSubview(seperator)
        contentView.addSubview(seperatorBottom)
    }
    
    private func layoutCellViews() {
        appAndDataName.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(15)
            
            ConstraintMaker.top.equalTo(contentView).offset(distance)
            ConstraintMaker.bottom.equalTo(contentView).offset(-distance)
            ConstraintMaker.left.equalTo(contentView).offset(distance)
        }
        
        nextIcon.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(-15)
            let size = CGSize(width: 15, height: 15)
            
            ConstraintMaker.right.equalTo(contentView).offset(distance)
            ConstraintMaker.size.equalTo(size)
            ConstraintMaker.centerY.equalTo(contentView.snp.centerY)
        }
        
        seperator.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(appAndDataName)
            ConstraintMaker.right.equalTo(nextIcon)
            ConstraintMaker.bottom.equalTo(contentView)
            ConstraintMaker.height.equalTo(1 / Size.screenScale)
        }
        
        seperatorBottom.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.bottom.equalTo(contentView)
            ConstraintMaker.height.equalTo(1 / Size.screenScale)
        }
    }
    
    private func setCellViews() {
        backgroundColor = Color.hexwhite
        selectionStyle = .none
        seperatorBottom.isHidden = true
    }
    
    // MARK: - Controller Attributes
    fileprivate var appAndDataName_: UILabel?
    fileprivate var nextIcon_: UIImageView?
    fileprivate var seperator_: UIView?
    fileprivate var seperatorBottom_: UIView?
}

// MARK: - Getters and Setters
extension ProductAppAndDataCell {
    var appAndDataName: UILabel {
        if appAndDataName_ == nil {
            appAndDataName_ = UILabel()
            appAndDataName_?.textColor = Color.hex333333
            appAndDataName_?.font = Font.size15
            appAndDataName_?.textAlignment = .left
            
            return appAndDataName_!
        }
        
        return appAndDataName_!
    }
    
    fileprivate var nextIcon: UIImageView {
        if nextIcon_ == nil {
            nextIcon_ = UIImageView()
            nextIcon_?.image = UIImage(named: Icon.next)
            
            return nextIcon_!
        }
        
        return nextIcon_!
    }
    
    var seperator: UIView {
        if seperator_ == nil {
            seperator_ = UIView()
            seperator_?.backgroundColor = Color.hexe6e6e6
            
            return seperator_!
        }
        
        return seperator_!
    }
    
    var seperatorBottom: UIView {
        if seperatorBottom_ == nil {
            seperatorBottom_ = UIView()
            seperatorBottom_?.backgroundColor = Color.hexe2e3e5
            
            return seperatorBottom_!
        }
        
        return seperatorBottom_!
    }
}
