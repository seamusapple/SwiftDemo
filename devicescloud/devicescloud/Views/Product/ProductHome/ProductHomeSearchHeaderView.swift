//
//  ProductHomeSearchHeaderView.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/13.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ProductHomeSearchHeaderView: UIView {

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
        addSubview(title)
        addSubview(seperator)
    }
    
    private func layoutPageViews() {
        title.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(15)
            
            ConstraintMaker.left.equalTo(self).offset(distance)
            ConstraintMaker.centerY.equalTo(self.snp.centerY)
        }
        
        seperator.snp.makeConstraints { (ConstraintMaker) in
            let height = CGFloat(1 / Size.screenScale)
            
            ConstraintMaker.left.right.bottom.equalTo(self)
            ConstraintMaker.height.equalTo(height)
        }
    }
    
    // MARK: - Controller Attributes
    fileprivate var title_: UILabel?
    fileprivate var seperator_: UIView?
}

// MARK: - Getters and Setters
extension ProductHomeSearchHeaderView {
    fileprivate var title: UILabel {
        if title_ == nil {
            title_ = UILabel()
            title_?.text = "历史记录"
            title_?.textColor = Color.hex999999
            title_?.font = Font.size12
            title_?.textAlignment = .left
            
            return title_!
        }
        
        return title_!
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
