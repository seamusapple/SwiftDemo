//
//  ProductDeviceCell.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/13.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ProductDeviceCell: UITableViewCell {

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
        contentView.addSubview(deviceImage)
        contentView.addSubview(deviceName)
        contentView.addSubview(deviceID)
        contentView.addSubview(nextIcon)
        contentView.addSubview(seperator)
        contentView.addSubview(seperatorBottom)
    }
    
    private func layoutCellViews() {
        deviceImage.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(15)
            let size = CGSize(width: 40, height: 40)
            
            ConstraintMaker.left.top.equalTo(contentView).offset(distance)
            ConstraintMaker.bottom.equalTo(contentView).offset(-distance)
            ConstraintMaker.centerY.equalTo(contentView)
            ConstraintMaker.size.equalTo(size)
        }
        
        deviceName.snp.makeConstraints { (ConstraintMaker) in
            let distance = 10
            
            ConstraintMaker.top.equalTo(deviceImage)
            ConstraintMaker.left.equalTo(deviceImage.snp.right).offset(distance)
        }
        
        deviceID.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.bottom.equalTo(deviceImage)
            ConstraintMaker.left.equalTo(deviceName.snp.left)
        }
        
        nextIcon.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(-15)
            let size = CGSize(width: 15, height: 15)
            
            ConstraintMaker.right.equalTo(contentView).offset(distance)
            ConstraintMaker.size.equalTo(size)
            ConstraintMaker.centerY.equalTo(contentView)
        }
        
        seperator.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(deviceImage)
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
    fileprivate var deviceImage_: UIImageView?
    fileprivate var deviceName_: UILabel?
    fileprivate var deviceID_: UILabel?
    fileprivate var nextIcon_: UIImageView?
    fileprivate var seperator_: UIView?
    fileprivate var seperatorBottom_: UIView?
}

// MARK: - Getters and Setters
extension ProductDeviceCell {
    var deviceImage: UIImageView {
        if deviceImage_ == nil {
            deviceImage_ = UIImageView()
            
            return deviceImage_!
        }
        
        return deviceImage_!
    }
    
    var deviceName: UILabel {
        if deviceName_ == nil {
            deviceName_ = UILabel()
            deviceName_?.textColor = Color.hex333333
            deviceName_?.font = Font.size15
            deviceName_?.textAlignment = .left
            
            return deviceName_!
        }
        
        return deviceName_!
    }
    
    var deviceID: UILabel {
        if deviceID_ == nil {
            deviceID_ = UILabel()
            deviceID_?.textColor = Color.hex666666
            deviceID_?.font = Font.size14
            deviceID_?.textAlignment = .left
            
            return deviceID_!
        }
        
        return deviceID_!
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
