//
//  ProductDeviceHomeTopView.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/15.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ProductDeviceHomeTopView: UIView {

    // MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addPageViews()
        layoutPageViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Settings
    private func addPageViews() {
        addSubview(deviceLogo)
        addSubview(deviceName)
        addSubview(seperator)
    }
    
    private func layoutPageViews() {
        deviceLogo.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(15)
            let distanceRight = CGFloat(10)
            
            ConstraintMaker.left.top.equalTo(self).offset(distance)
            ConstraintMaker.bottom.equalTo(self).offset(-distance)
            ConstraintMaker.right.equalTo(deviceName.snp.left).offset(-distanceRight)
            ConstraintMaker.width.equalTo(deviceLogo.snp.height)
        }
        
        deviceName.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(10)
            
            ConstraintMaker.left.equalTo(deviceLogo.snp.right).offset(distance)
            ConstraintMaker.centerY.equalTo(self)
        }
        
        seperator.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.bottom.equalTo(self)
            ConstraintMaker.height.equalTo(1 / Size.screenScale)
        }
    }
    
    // MARK: - Controller Attributes
    fileprivate var deviceLogo_: UIImageView?
    fileprivate var deviceName_: UILabel?
    fileprivate var seperator_: UIView?
}

// MARK: - Getters and Setters
extension ProductDeviceHomeTopView {
    var deviceLogo: UIImageView {
        if deviceLogo_ == nil {
            deviceLogo_ = UIImageView()
            
            return deviceLogo_!
        }
        
        return deviceLogo_!
    }
    
    var deviceName: UILabel {
        if deviceName_ == nil {
            deviceName_ = UILabel()
            deviceName_?.textColor = Color.hex333333
            deviceName_?.textAlignment = .left
            deviceName_?.font = Font.size16
            
            return deviceName_!
        }
        
        return deviceName_!
    }
    
    fileprivate var seperator: UIView {
        if seperator_ == nil {
            seperator_ = UIView()
            seperator_?.backgroundColor = Color.hexe6e6e6
            
            return seperator_!
        }
        
        return seperator_!
    }
}
