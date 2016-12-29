//
//  ProductHomeSearchCell.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/13.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ProductHomeSearchCell: UITableViewCell {

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
        contentView.addSubview(searchItem)
        contentView.addSubview(deleteIcon)
        contentView.addSubview(seperator)
    }
    
    private func layoutCellViews() {
        seperator.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(15)
            let height = CGFloat(1 / Size.screenScale)
            
            ConstraintMaker.left.equalTo(contentView).offset(distance)
            ConstraintMaker.right.equalTo(contentView).offset(-distance)
            ConstraintMaker.bottom.equalTo(contentView)
            ConstraintMaker.height.equalTo(height)
        }
        
        searchItem.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(seperator)
            ConstraintMaker.centerY.equalTo(contentView.snp.centerY)
        }
        
        deleteIcon.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(-25)
            let size = CGSize(width: 10, height: 10)
            
            ConstraintMaker.right.equalTo(contentView).offset(distance)
            ConstraintMaker.centerY.equalTo(contentView)
            ConstraintMaker.size.equalTo(size)
        }
    }
    
    private func setCellViews() {
        selectionStyle = .none
    }
    
    // MARK: - Controller Attributes
    fileprivate var searchItem_: UILabel?
    fileprivate var deleteIcon_: UIImageView?
    fileprivate var seperator_: UIView?
}

// MARK: - Getters and Setters
extension ProductHomeSearchCell {
    var searchItem: UILabel {
        if searchItem_ == nil {
            searchItem_ = UILabel()
            searchItem_?.font = Font.size14
            searchItem_?.textColor = Color.hex666666
            searchItem_?.textAlignment = .left
            return searchItem_!
        }
        
        return searchItem_!
    }
    
    fileprivate var deleteIcon: UIImageView {
        if deleteIcon_ == nil {
            deleteIcon_ = UIImageView()
            deleteIcon_?.image = UIImage(named: Icon.pordoctDelete)
            return deleteIcon_!
        }
        
        return deleteIcon_!
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
