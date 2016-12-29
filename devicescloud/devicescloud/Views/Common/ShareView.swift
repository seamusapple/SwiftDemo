//
//  ShareView.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/20.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ShareView: UIView {

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
        addSubview(shareIcon)
        addSubview(shareName)
    }
    
    private func layoutPageViews() {
        shareIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.top.equalTo(self)
            ConstraintMaker.bottom.equalTo(shareName.snp.top).offset(-10)
            ConstraintMaker.size.equalTo(CGSize(width: 55, height: 55))
        }
        
        shareName.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(shareIcon.snp.bottom).offset(10)
            ConstraintMaker.left.right.bottom.equalTo(self)
        }
    }
    
    // MARK: - Controller Attributes
    fileprivate var shareIcon_: UIImageView?
    fileprivate var shareName_: UILabel?
}

// MARK: - Getters and Setters
extension ShareView {
    var shareIcon: UIImageView {
        if shareIcon_ == nil {
            shareIcon_ = UIImageView()
            shareIcon_?.layer.cornerRadius = CGFloat(10)
            shareIcon_?.layer.masksToBounds = true
            
            return shareIcon_!
        }
        
        return shareIcon_!
    }
    
    var shareName: UILabel {
        if shareName_ == nil {
            shareName_ = UILabel()
            shareName_?.textAlignment = .center
            shareName_?.textColor = Color.hex666666
            shareName_?.font = Font.size12
            
            return shareName_!
        }
        
        return shareName_!
    }
}
