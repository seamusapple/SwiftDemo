//
//  ProductEventAndSensorCell.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/14.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ProductEventAndSensorCell: UITableViewCell {

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
        contentView.addSubview(nameLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(unread)
        contentView.addSubview(nextIcon)
        contentView.addSubview(seperator)
        contentView.addSubview(seperatorBottom)
    }
    
    private func layoutCellViews() {
        nameLabel.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(15)
            let distanceRight = CGFloat(-5)
            
            ConstraintMaker.left.top.equalTo(contentView).offset(distance)
            ConstraintMaker.bottom.equalTo(contentView).offset(-distance)
            ConstraintMaker.right.equalTo(unread.snp.left).offset(distanceRight)
        }
        
        unread.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(5)
            let size = CGSize(width: 8, height: 8)
            
            ConstraintMaker.left.equalTo(nameLabel.snp.right).offset(distance)
            ConstraintMaker.bottom.equalTo(nameLabel.snp.top)
            ConstraintMaker.size.equalTo(size)
        }
        
        nextIcon.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(-15)
            let distanceLeft = CGFloat(5)
            let size = CGSize(width: 15, height: 15)
            
            ConstraintMaker.right.equalTo(contentView).offset(distance)
            ConstraintMaker.centerY.equalTo(contentView)
            ConstraintMaker.left.equalTo(timeLabel.snp.right).offset(distanceLeft)
            ConstraintMaker.size.equalTo(size)
        }
        
        timeLabel.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(-5)
            
            ConstraintMaker.right.equalTo(nextIcon.snp.left).offset(distance)
            ConstraintMaker.centerY.equalTo(contentView)
        }
        
        seperator.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(-15)
            
            ConstraintMaker.left.equalTo(nameLabel)
            ConstraintMaker.right.equalTo(contentView).offset(distance)
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
        unread.isHidden = true
    }
    
    // MARK: - Controller Attributes
    fileprivate var nameLabel_: UILabel?
    fileprivate var timeLabel_: UILabel?
    fileprivate var unread_: UIView?
    fileprivate var nextIcon_: UIImageView?
    fileprivate var seperator_: UIView?
    fileprivate var seperatorBottom_: UIView?
}

// MARK: - Getters and Setters
extension ProductEventAndSensorCell {
    var nameLabel: UILabel {
        if nameLabel_ == nil {
            nameLabel_ = UILabel()
            nameLabel_?.textColor = Color.hex333333
            nameLabel_?.textAlignment = .left
            nameLabel_?.font = Font.size15
            
            return nameLabel_!
        }
        
        return nameLabel_!
    }
    
    var timeLabel: UILabel {
        if timeLabel_ == nil {
            timeLabel_ = UILabel()
            timeLabel_?.textColor = Color.hex666666
            timeLabel_?.textAlignment = .right
            timeLabel_?.font = Font.size14

            return timeLabel_!
        }
        
        return timeLabel_!
    }
    
    fileprivate var nextIcon: UIImageView {
        if nextIcon_ == nil {
            nextIcon_ = UIImageView()
            nextIcon_?.image = UIImage(named: Icon.next)
            
            return nextIcon_!
        }
        
        return nextIcon_!
    }
    
    var unread: UIView {
        if unread_ == nil {
            unread_ = UIView()
            unread_?.layer.cornerRadius = CGFloat(4)
            unread_?.layer.masksToBounds = true
            unread_?.backgroundColor = Color.hexff4931
            
            return unread_!
        }
        
        return unread_!
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
