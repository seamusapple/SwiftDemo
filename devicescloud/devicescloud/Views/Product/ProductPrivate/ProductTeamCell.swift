//
//  ProductTeamCell.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/14.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ProductTeamCell: UITableViewCell {

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
        contentView.addSubview(memberLogo)
        contentView.addSubview(memberName)
        contentView.addSubview(memberCharacter)
        contentView.addSubview(seperator)
        contentView.addSubview(seperatorBottom)
    }
    
    private func layoutCellViews() {
        memberLogo.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(15)
            let distanceVertical = CGFloat(10)
            let size = CGSize(width: 40, height: 40)
            
            ConstraintMaker.left.equalTo(contentView).offset(distance)
            ConstraintMaker.top.equalTo(contentView).offset(distanceVertical)
            ConstraintMaker.bottom.equalTo(contentView).offset(-distanceVertical)
            ConstraintMaker.size.equalTo(size)
        }
        
        memberName.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(10)
            
            ConstraintMaker.left.equalTo(memberLogo.snp.right).offset(distance)
            ConstraintMaker.centerY.equalTo(memberLogo)
        }
        
        memberCharacter.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(-30)
            
            ConstraintMaker.right.equalTo(contentView).offset(distance)
            ConstraintMaker.centerY.equalTo(memberLogo)
        }
        
        seperator.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(-15)
            
            ConstraintMaker.left.equalTo(memberLogo)
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
    }
    
    // MARK: - Controller Attributes
    fileprivate var memberLogo_: UIImageView?
    fileprivate var memberName_: UILabel?
    fileprivate var memberCharacter_: UILabel?
    fileprivate var seperator_: UIView?
    fileprivate var seperatorBottom_: UIView?
}

// MARK: - Getters and Setters
extension ProductTeamCell {
    var memberLogo: UIImageView {
        if memberLogo_ == nil {
            memberLogo_ = UIImageView()
            memberLogo_?.layer.cornerRadius = CGFloat(20)
            memberLogo_?.layer.masksToBounds = true
            memberLogo_?.layer.borderWidth = CGFloat(1 / Size.screenScale)
            memberLogo_?.layer.borderColor = Color.hexcecece.cgColor
            
            return memberLogo_!
        }
        
        return memberLogo_!
    }
    
    var memberName: UILabel {
        if memberName_ == nil {
            memberName_ = UILabel()
            memberName_?.textColor = Color.hex333333
            memberName_?.textAlignment = .left
            memberName_?.font = Font.size15
            
            return memberName_!
        }
        
        return memberName_!
    }
    
    var memberCharacter: UILabel {
        if memberCharacter_ == nil {
            memberCharacter_ = UILabel()
            memberCharacter_?.textColor = Color.hex666666
            memberCharacter_?.textAlignment = .left
            memberCharacter_?.font = Font.size15
            
            return memberCharacter_!
        }
        
        return memberCharacter_!
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
