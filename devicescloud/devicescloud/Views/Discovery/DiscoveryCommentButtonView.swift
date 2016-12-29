//
//  DiscoveryCommentButtonView.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/21.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class DiscoveryCommentButtonView: UIView {

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
        addSubview(commentText)
        addSubview(commentButton)
        addSubview(seperator)
    }
    
    private func layoutPageViews() {
        commentText.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(self).offset(15)
            ConstraintMaker.bottom.right.equalTo(self)
            ConstraintMaker.top.equalTo(seperator.snp.bottom)
        }
        
        commentButton.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(seperator.snp.bottom)
            ConstraintMaker.left.right.bottom.equalTo(self)
        }
        
        seperator.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.top.equalTo(self)
            ConstraintMaker.height.equalTo(1 / Size.screenScale)
        }
    }
    
    private func setPageViews() {
        backgroundColor = Color.hexwhite
    }
    
    // MARK: - Controller Attributes
    fileprivate var seperator_: UIView?
    fileprivate var commentText_: UILabel?
    fileprivate var commentButton_: UIButton?
}

// MARK: - Getters and Setters
extension DiscoveryCommentButtonView {
    fileprivate var seperator: UIView {
        if seperator_ == nil {
            seperator_ = UIView()
            seperator_?.backgroundColor = Color.hexe6e6e6
            
            return seperator_!
        }
        
        return seperator_!
    }
    
    fileprivate var commentText: UILabel {
        if commentText_ == nil {
            commentText_ = UILabel()
            commentText_?.textAlignment = .left
            commentText_?.textColor = Color.hexcccccc
            commentText_?.font = Font.size16
            commentText_?.text = TextStr.writeComment
            
            return commentText_!
        }
        
        return commentText_!
    }
    
    var commentButton: UIButton {
        if commentButton_ == nil {
            commentButton_ = UIButton()
            
            return commentButton_!
        }
        
        return commentButton_!
    }
}
