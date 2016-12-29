//
//  DiscoveryHomeCell.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/19.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class DiscoveryHomeCell: UITableViewCell {

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
        contentView.addSubview(productName)
        contentView.addSubview(constructor)
        contentView.addSubview(likeView)
        contentView.addSubview(likeNum)
        contentView.addSubview(commentView)
        contentView.addSubview(commentNum)
        contentView.addSubview(seperator)
        contentView.addSubview(seperatorVerticalOne)
        contentView.addSubview(seperatorVerticalTwo)
        contentView.addSubview(seperatorBottom)
    }
    
    private func layoutCellViews() {
        productName.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.top.equalTo(contentView).offset(15)
            ConstraintMaker.bottom.equalTo(constructor.snp.top).offset(-10)
        }
        
        constructor.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(productName.snp.bottom).offset(10)
            ConstraintMaker.left.equalTo(productName)
            ConstraintMaker.bottom.equalTo(contentView).offset(-15)
        }
        
        seperatorVerticalOne.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(constructor.snp.right).offset(20)
            ConstraintMaker.centerY.equalTo(constructor)
            ConstraintMaker.width.equalTo(1 / Size.screenScale)
            ConstraintMaker.height.equalTo(constructor)
        }
        
        likeView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(seperatorVerticalOne.snp.right).offset(20)
            ConstraintMaker.size.equalTo(CGSize(width: 15, height: 15))
            ConstraintMaker.centerY.equalTo(constructor)
        }
        
        likeNum.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(likeView.snp.right).offset(5)
            ConstraintMaker.centerY.equalTo(constructor)
            ConstraintMaker.right.equalTo(seperatorVerticalTwo.snp.left).offset(-20)
        }
        
        seperatorVerticalTwo.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(likeNum.snp.right).offset(20)
            ConstraintMaker.centerY.equalTo(constructor)
            ConstraintMaker.width.equalTo(1 / Size.screenScale)
            ConstraintMaker.height.equalTo(seperatorVerticalOne)
        }
        
        commentView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(seperatorVerticalTwo.snp.right).offset(20)
            ConstraintMaker.size.equalTo(CGSize(width: 15, height: 15))
            ConstraintMaker.centerY.equalTo(constructor)
        }
        
        commentNum.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(commentView.snp.right).offset(5)
            ConstraintMaker.centerY.equalTo(constructor)
        }
        
        seperator.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(productName)
            ConstraintMaker.right.equalTo(contentView).offset(-15)
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
    fileprivate var productName_: UILabel?
    fileprivate var constructor_: UILabel?
    fileprivate var likeView_: UIImageView?
    fileprivate var likeNum_: UILabel?
    fileprivate var commentView_: UIImageView?
    fileprivate var commentNum_: UILabel?
    fileprivate var seperator_: UIView?
    fileprivate var seperatorVerticalOne_: UIView?
    fileprivate var seperatorVerticalTwo_: UIView?
    fileprivate var seperatorBottom_: UIView?
}

// MARK: - Getters and Setters
extension DiscoveryHomeCell {
    var productName: UILabel {
        if productName_ == nil {
            productName_ = UILabel()
            productName_?.textAlignment = .left
            productName_?.textColor = Color.hex333333
            productName_?.font = Font.size15
            
            return productName_!
        }
        
        return productName_!
    }
    
    var constructor: UILabel {
        if constructor_ == nil {
            constructor_ = UILabel()
            constructor_?.textAlignment = .left
            constructor_?.textColor = Color.hex666666
            constructor_?.font = Font.size14
            
            return constructor_!
        }
        
        return constructor_!
    }
    
    var likeView: UIImageView {
        if likeView_ == nil {
            likeView_ = UIImageView()
            return likeView_!
        }
        
        return likeView_!
    }
    
    var likeNum: UILabel {
        if likeNum_ == nil {
            likeNum_ = UILabel()
            likeNum_?.textAlignment = .left
            likeNum_?.textColor = Color.hex666666
            likeNum_?.font = Font.size14
            
            return likeNum_!
        }
        
        return likeNum_!
    }
    
    fileprivate var commentView: UIImageView {
        if commentView_ == nil {
            commentView_ = UIImageView()
            commentView_?.image = UIImage(named: Icon.comment)
            
            return commentView_!
        }
        
        return commentView_!
    }
    
    var commentNum: UILabel {
        if commentNum_ == nil {
            commentNum_ = UILabel()
            commentNum_?.textAlignment = .left
            commentNum_?.textColor = Color.hex666666
            commentNum_?.font = Font.size14
            
            return commentNum_!
        }
        
        return commentNum_!
    }
    
    var seperator: UIView {
        if seperator_ == nil {
            seperator_ = UIView()
            seperator_?.backgroundColor = Color.hexe6e6e6
            
            return seperator_!
        }
        
        return seperator_!
    }
    
    fileprivate var seperatorVerticalOne: UIView {
        if seperatorVerticalOne_ == nil {
            seperatorVerticalOne_ = UIView()
            seperatorVerticalOne_?.backgroundColor = Color.hexcecece
            
            return seperatorVerticalOne_!
        }
        
        return seperatorVerticalOne_!
    }
    
    fileprivate var seperatorVerticalTwo: UIView {
        if seperatorVerticalTwo_ == nil {
            seperatorVerticalTwo_ = UIView()
            seperatorVerticalTwo_?.backgroundColor = Color.hexcecece
            
            return seperatorVerticalTwo_!
        }
        
        return seperatorVerticalTwo_!
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
