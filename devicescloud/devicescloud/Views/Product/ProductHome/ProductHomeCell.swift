//
//  ProductHomeCell.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/5.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ProductHomeCell: UITableViewCell {

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
        contentView.addSubview(backView)
        contentView.addSubview(title)
        contentView.addSubview(protocolType)
        contentView.addSubview(detail)
        contentView.addSubview(mainOne)
        contentView.addSubview(mainTwo)
        contentView.addSubview(mainThree)
        contentView.addSubview(mainFour)
        contentView.addSubview(seperatorOne)
        contentView.addSubview(seperatorTwo)
        contentView.addSubview(seperatorThree)
    }
    
    private func layoutCellViews() {
        backView.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(10)
            
            ConstraintMaker.left.right.bottom.equalTo(contentView)
            ConstraintMaker.top.equalTo(contentView).offset(distance)
        }
        
        title.snp.makeConstraints { (ConstraintMaker) in
            let distanceLT = CGFloat(15)
            let distanceR = CGFloat(-10)
            let distanceB = CGFloat(-20)
            let height = CGFloat(16)
            
            ConstraintMaker.left.top.equalTo(backView).offset(distanceLT)
            ConstraintMaker.right.equalTo(protocolType.snp.left).offset(distanceR)
            ConstraintMaker.bottom.equalTo(mainOne.snp.top).offset(distanceB)
            ConstraintMaker.height.equalTo(height)
        }
        
        protocolType.snp.makeConstraints { (ConstraintMaker) in
            let distanceL = CGFloat(10)
            
            ConstraintMaker.centerY.equalTo(title)
            ConstraintMaker.left.equalTo(title.snp.right).offset(distanceL)
        }
        
        detail.snp.makeConstraints { (ConstraintMaker) in
            let distanceR = CGFloat(-15)
            
            ConstraintMaker.centerY.equalTo(title.snp.centerY)
            ConstraintMaker.right.equalTo(backView).offset(distanceR)
        }
        
        mainOne.snp.makeConstraints { (ConstraintMaker) in
            let distanceT = CGFloat(20)
            let distanceB = CGFloat(-15)
            let factor = CGFloat(0.25)
            
            ConstraintMaker.top.equalTo(title.snp.bottom).offset(distanceT)
            ConstraintMaker.bottom.equalTo(backView).offset(distanceB)
            ConstraintMaker.centerX.equalTo(backView).multipliedBy(factor)
            ConstraintMaker.width.equalTo(backView).multipliedBy(factor)
        }
        
        seperatorOne.snp.makeConstraints { (ConstraintMaker) in
            let size = CGSize(width: 1, height: 30)
            
            ConstraintMaker.size.equalTo(size)
            ConstraintMaker.top.equalTo(mainOne)
            ConstraintMaker.left.equalTo(mainOne.snp.right)
        }
        
        mainTwo.snp.makeConstraints { (ConstraintMaker) in
            let factor = CGFloat(0.75)
            
            ConstraintMaker.top.bottom.width.equalTo(mainOne)
            ConstraintMaker.centerX.equalTo(backView.snp.centerX).multipliedBy(factor)
        }
        
        seperatorTwo.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.size.equalTo(seperatorOne)
            ConstraintMaker.centerX.equalTo(backView.snp.centerX)
        }
        
        mainThree.snp.makeConstraints { (ConstraintMaker) in
            let factor = CGFloat(1.25)
            
            ConstraintMaker.top.bottom.width.equalTo(mainOne)
            ConstraintMaker.centerX.equalTo(backView).multipliedBy(factor)
        }
        
        seperatorThree.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.size.equalTo(seperatorOne)
            ConstraintMaker.right.equalTo(mainFour.snp.left)
        }
        
        mainFour.snp.makeConstraints { (ConstraintMaker) in
            let factor = CGFloat(1.75)
            
            ConstraintMaker.top.bottom.width.equalTo(mainOne)
            ConstraintMaker.centerX.equalTo(backView).multipliedBy(factor)
        }
    }
    
    private func setCellViews() {
        backgroundColor = Color.hexf5f6f8
        selectionStyle = .none
    }
    
    // MARK: - Controller Attributes
    fileprivate var backView_: UIView?
    fileprivate var title_: UILabel?
    fileprivate var protocolType_: UILabel?
    fileprivate var detail_: ProductHomeDetailView?
    fileprivate var mainOne_: ProductHomeMainView?
    fileprivate var mainTwo_: ProductHomeMainView?
    fileprivate var mainThree_: ProductHomeMainView?
    fileprivate var mainFour_: ProductHomeMainView?
    fileprivate var seperatorOne_: UIView?
    fileprivate var seperatorTwo_: UIView?
    fileprivate var seperatorThree_: UIView?
}

// MARK: - Getters and Setters
extension ProductHomeCell {
    fileprivate var backView: UIView {
        if backView_ == nil {
            backView_ = UIView()
            backView_?.backgroundColor = Color.hexwhite
            backView_?.layer.borderColor = Color.hexe2e3e5.cgColor
            backView_?.layer.borderWidth = CGFloat(1 / Size.screenScale)
            return backView_!
        }
        
        return backView_!
    }
    
    fileprivate var title: UILabel {
        if title_ == nil {
            title_ = UILabel()
            title_?.text = TextStr.productTitle
            title_?.textColor = Color.hex333333
            title_?.textAlignment = .center
            title_?.font = Font.size16
            return title_!
        }
        
        return title_!
    }
    
    var protocolType: UILabel {
        if protocolType_ == nil {
            protocolType_ = UILabel()
            protocolType_?.textColor = Color.hex999999
            protocolType_?.textAlignment = .center
            protocolType_?.font = Font.size14
            return protocolType_!
        }
        
        return protocolType_!
    }
    
    var detail: ProductHomeDetailView {
        if detail_ == nil {
            detail_ = ProductHomeDetailView()
            return detail_!
        }
        
        return detail_!
    }
    
    var mainOne: ProductHomeMainView {
        if mainOne_ == nil {
            mainOne_ = ProductHomeMainView()
            mainOne_?.mainName.text = TextStr.productDevice
            mainOne_?.mainIcon.image = UIImage(named: Icon.productDevice)
            return mainOne_!
        }
        
        return mainOne_!
    }
    
    var mainTwo: ProductHomeMainView {
        if mainTwo_ == nil {
            mainTwo_ = ProductHomeMainView()
            return mainTwo_!
        }
        
        return mainTwo_!
    }
    
    var mainThree: ProductHomeMainView {
        if mainThree_ == nil {
            mainThree_ = ProductHomeMainView()
            return mainThree_!
        }
        
        return mainThree_!
    }
    
    var mainFour: ProductHomeMainView {
        if mainFour_ == nil {
            mainFour_ = ProductHomeMainView()
            return mainFour_!
        }
        
        return mainFour_!
    }
    
    fileprivate var seperatorOne: UIView {
        if seperatorOne_ == nil {
            seperatorOne_ = UIView()
            seperatorOne_?.backgroundColor = Color.hexe6e6e6
            return seperatorOne_!
        }
        
        return seperatorOne_!
    }
    
    fileprivate var seperatorTwo: UIView {
        if seperatorTwo_ == nil {
            seperatorTwo_ = UIView()
            seperatorTwo_?.backgroundColor = Color.hexe6e6e6
            return seperatorTwo_!
        }
        
        return seperatorTwo_!
    }
    
    fileprivate var seperatorThree: UIView {
        if seperatorThree_ == nil {
            seperatorThree_ = UIView()
            seperatorThree_?.backgroundColor = Color.hexe6e6e6
            return seperatorThree_!
        }
        
        return seperatorThree_!
    }
}
