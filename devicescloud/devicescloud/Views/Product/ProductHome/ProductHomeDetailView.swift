//
//  ProductHomeDetailView.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/5.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit
import SnapKit

class ProductHomeDetailView: UIView {
    
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
        addSubview(detail)
        addSubview(nextImage)
        addSubview(push)
    }
    
    private func layoutPageViews() {
        let distance = CGFloat(3)
        
        detail.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.top.bottom.equalTo(self)
            ConstraintMaker.right.equalTo(nextImage.snp.left).offset(-distance)
        }
        
        nextImage.snp.makeConstraints { (ConstraintMaker) in
            let size = CGSize(width: 10, height: 10)
            
            ConstraintMaker.left.equalTo(detail.snp.right).offset(distance)
            ConstraintMaker.size.equalTo(size)
            ConstraintMaker.right.equalTo(self)
            ConstraintMaker.centerY.equalTo(detail.snp.centerY)
        }
        
        push.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalTo(self)
        }
    }
    
    // MARK: - Controller Attributes
    fileprivate var detail_: UILabel?
    fileprivate var nextImage_: UIImageView?
    fileprivate var push_: UIButton?
}

// MARK: - Getters and Setters
extension ProductHomeDetailView {
    fileprivate var detail: UILabel {
        if detail_ == nil {
            detail_ = UILabel()
            detail_?.text = TextStr.productDetail
            detail_?.textColor = Color.hex666666
            detail_?.textAlignment = .center
            detail_?.font = Font.size12
            return detail_!
        }
        
        return detail_!
    }
    
    fileprivate var nextImage: UIImageView {
        if nextImage_ == nil {
            nextImage_ = UIImageView()
            nextImage_?.image = UIImage(named: Icon.next)
            return nextImage_!
        }
        
        return nextImage_!
    }
    
    var push: UIButton {
        if push_ == nil {
            push_ = UIButton()
            return push_!
        }
        
        return push_!
    }
}
