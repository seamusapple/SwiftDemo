//
//  BlankHeaderView.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/14.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class BlankHeaderView: UIView {

    // MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addPageViews()
        layoutPageViews()
        setPageViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Settings
    private func addPageViews() {
        addSubview(seperator)
    }
    
    private func layoutPageViews() {
        seperator.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.bottom.equalTo(self)
            ConstraintMaker.height.equalTo(1 / Size.screenScale)
        }
    }
    
    private func setPageViews() {
        backgroundColor = Color.hexf5f6f8
    }
    
    // MARK: - Controller Attributes
    fileprivate var seperator_: UIView?
}

// MARK: - Getters and Setters
extension BlankHeaderView {
    fileprivate var seperator: UIView {
        if seperator_ == nil {
            seperator_ = UIView()
            seperator_?.backgroundColor = Color.hexe2e3e5
            
            return seperator_!
        }
        
        return seperator_!
    }
}
