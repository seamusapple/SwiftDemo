//
//  ProductTriggerCell.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/14.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ProductTriggerCell: UITableViewCell {

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
        contentView.addSubview(triggerName)
        contentView.addSubview(dataName)
        contentView.addSubview(deviceArea)
        contentView.addSubview(nextIcon)
        contentView.addSubview(seperator)
        contentView.addSubview(seperatorBottom)
    }
    
    private func layoutCellViews() {
        triggerName.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(15)
            let distanceBt = CGFloat(-10)
            
            ConstraintMaker.left.top.equalTo(contentView).offset(distance)
            ConstraintMaker.bottom.equalTo(dataName.snp.top).offset(distanceBt)
        }
        
        dataName.snp.makeConstraints { (ConstraintMaker) in
            let distanceTop = CGFloat(10)
            let distanceBt = CGFloat(-5)
            
            ConstraintMaker.left.equalTo(triggerName)
            ConstraintMaker.top.equalTo(triggerName.snp.bottom).offset(distanceTop)
            ConstraintMaker.bottom.equalTo(deviceArea.snp.top).offset(distanceBt)
        }
        
        deviceArea.snp.makeConstraints { (ConstraintMaker) in
            let distanceTop = CGFloat(5)
            let distanceBt = CGFloat(-12)
            
            ConstraintMaker.left.equalTo(triggerName)
            ConstraintMaker.top.equalTo(dataName.snp.bottom).offset(distanceTop)
            ConstraintMaker.bottom.equalTo(contentView).offset(distanceBt)
        }
        
        nextIcon.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(-15)
            let size = CGSize(width: 15, height: 15)
            
            ConstraintMaker.right.equalTo(contentView).offset(distance)
            ConstraintMaker.size.equalTo(size)
            ConstraintMaker.centerY.equalTo(contentView.snp.centerY)
        }
        
        seperator.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(triggerName)
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
    fileprivate var triggerName_: UILabel?
    fileprivate var dataName_: UILabel?
    fileprivate var deviceArea_: UILabel?
    fileprivate var nextIcon_: UIImageView?
    fileprivate var seperator_: UIView?
    fileprivate var seperatorBottom_: UIView?
}

// MARK: - Getters and Setters
extension ProductTriggerCell {
    var triggerName: UILabel {
        if triggerName_ == nil {
            triggerName_ = UILabel()
            triggerName_?.font = Font.size15
            triggerName_?.textColor = Color.hex333333
            triggerName_?.textAlignment = .left
            
            return triggerName_!
        }
        
        return triggerName_!
    }
    
    var dataName: UILabel {
        if dataName_ == nil {
            dataName_ = UILabel()
            dataName_?.font = Font.size14
            dataName_?.textColor = Color.hex666666
            dataName_?.textAlignment = .left

            return dataName_!
        }
        
        return dataName_!
    }
    
    var deviceArea: UILabel {
        if deviceArea_ == nil {
            deviceArea_ = UILabel()
            deviceArea_?.font = Font.size14
            deviceArea_?.textColor = Color.hex666666
            deviceArea_?.textAlignment = .left

            return deviceArea_!
        }
        
        return deviceArea_!
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
