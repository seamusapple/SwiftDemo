//
//  ProductHomeMainView.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/5.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ProductHomeMainView: UIView {

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
        addSubview(mainIcon)
        addSubview(mainName)
        addSubview(numBg)
        addSubview(mainNum)
        addSubview(mainButton)
    }
    
    private func layoutPageViews() {
        let distance = CGFloat(5)
        
        mainIcon.snp.makeConstraints { (ConstraintMaker) in
            let size = CGSize(width: 30, height: 30)
            
            ConstraintMaker.size.equalTo(size)
            ConstraintMaker.centerX.equalTo(self.snp.centerX)
            ConstraintMaker.top.equalTo(self)
            ConstraintMaker.bottom.equalTo(mainName.snp.top).offset(-distance)
        }
        
        mainName.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(mainIcon.snp.bottom).offset(distance)
            ConstraintMaker.centerX.equalTo(mainIcon.snp.centerX)
            ConstraintMaker.bottom.equalTo(numBg.snp.top).offset(-distance)
        }
        
        numBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(mainName.snp.bottom).offset(distance)
            ConstraintMaker.centerX.equalTo(mainName.snp.centerX)
            ConstraintMaker.bottom.equalTo(self)
        }
        
        mainNum.snp.makeConstraints { (ConstraintMaker) in
            let distance = CGFloat(3)
            
            ConstraintMaker.top.equalTo(numBg.snp.top).offset(distance)
            ConstraintMaker.left.right.bottom.equalTo(numBg)
        }
        
        mainButton.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalTo(self)
        }
    }
    
    // MARK: - Controller Attributes
    fileprivate var mainIcon_: UIImageView?
    fileprivate var mainName_: UILabel?
    fileprivate var mainNum_: UILabel?
    fileprivate var numBg_: UIImageView?
    fileprivate var mainButton_: UIButton?
}

// MARK: - Getters and Setters
extension ProductHomeMainView {
    var mainIcon: UIImageView {
        if mainIcon_ == nil {
            mainIcon_ = UIImageView()
            return mainIcon_!
        }
        
        return mainIcon_!
    }
    
    var mainName: UILabel {
        if mainName_ == nil {
            mainName_ = UILabel()
            mainName_?.font = Font.size12
            mainName_?.textColor = Color.hex333333
            mainName_?.textAlignment = .center
            return mainName_!
        }
        
        return mainName_!
    }
    
    fileprivate var numBg: UIImageView {
        if numBg_ == nil {
            numBg_ = UIImageView()
            numBg_?.image = UIImage(named: Icon.numBg)
            return numBg_!
        }
        
        return numBg_!
    }
    
    var mainNum: UILabel {
        if mainNum_ == nil {
            mainNum_ = UILabel()
            mainNum_?.textColor = Color.hex999999
            mainNum_?.font = Font.size10
            mainNum_?.textAlignment = .center
            return mainNum_!
        }
        
        return mainNum_!
    }
    
    var mainButton: UIButton {
        if mainButton_ == nil {
            mainButton_ = UIButton()
            return mainButton_!
        }
        
        return mainButton_!
    }
}
