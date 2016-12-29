//
//  DiscoveryCommentListCell.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/21.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class DiscoveryCommentListCell: UITableViewCell {

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
        contentView.addSubview(avatar)
        contentView.addSubview(name)
        contentView.addSubview(time)
        contentView.addSubview(comment)
        contentView.addSubview(likeIcon)
        contentView.addSubview(likeNum)
        contentView.addSubview(commentIcon)
        contentView.addSubview(seperator)
    }
    
    private func layoutCellViews() {
        avatar.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.top.equalTo(contentView).offset(15)
            ConstraintMaker.right.equalTo(name.snp.left).offset(-10)
            ConstraintMaker.size.equalTo(CGSize(width: 40, height: 40))
        }
        
        name.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(avatar).offset(2)
            ConstraintMaker.left.equalTo(avatar.snp.right).offset(10)
            ConstraintMaker.bottom.equalTo(time.snp.top).offset(-7)
        }
        
        time.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(name.snp.bottom).offset(7)
            ConstraintMaker.left.equalTo(name)
            ConstraintMaker.bottom.equalTo(comment.snp.top).offset(-10)
        }
        
        comment.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(time.snp.bottom).offset(10)
            ConstraintMaker.left.equalTo(name)
            ConstraintMaker.bottom.equalTo(contentView).offset(-15)
        }
        
        likeIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(avatar)
            ConstraintMaker.size.equalTo(CGSize(width: 15, height: 15))
            ConstraintMaker.right.equalTo(likeNum.snp.left).offset(-5)
        }
        
        likeNum.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(likeIcon.snp.right).offset(5)
            ConstraintMaker.centerY.equalTo(likeIcon)
            ConstraintMaker.right.equalTo(commentIcon.snp.left).offset(-25)
        }
        
        commentIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(likeIcon)
            ConstraintMaker.left.equalTo(likeNum.snp.right).offset(25)
            ConstraintMaker.right.equalTo(contentView).offset(-25)
        }
        
        seperator.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(avatar)
            ConstraintMaker.right.equalTo(contentView).offset(-15)
            ConstraintMaker.bottom.equalTo(contentView)
            ConstraintMaker.height.equalTo(1 / Size.screenScale)
        }
    }
    
    private func setCellViews() {
        
    }
    
    // MARK: - Controller Attributes
    fileprivate var avatar_: UIImageView?
    fileprivate var name_: UILabel?
    fileprivate var time_: UILabel?
    fileprivate var comment_: UILabel?
    fileprivate var likeIcon_: UIButton?
    fileprivate var likeNum_: UILabel?
    fileprivate var commentIcon_: UIButton?
    fileprivate var seperator_: UIView?

}

// MARK: - Getters and Setters
extension DiscoveryCommentListCell {
    var avatar: UIImageView {
        if avatar_ == nil {
            avatar_ = UIImageView()
            avatar_?.layer.cornerRadius = CGFloat(20)
            avatar_?.layer.masksToBounds = true
            avatar_?.layer.borderWidth = 1 / Size.screenScale
            avatar_?.layer.borderColor = Color.hexcecece.cgColor
            
            return avatar_!
        }
        
        return avatar_!
    }
    
    var name: UILabel {
        if name_ == nil {
            name_ = UILabel()
            name_?.textAlignment = .left
            name_?.textColor = Color.hex666666
            name_?.font = Font.size14
            
            return name_!
        }
        
        return name_!
    }
    
    var time: UILabel {
        if time_ == nil {
            time_ = UILabel()
            time_?.textAlignment = .left
            time_?.textColor = Color.hex999999
            time_?.font = Font.size10
            
            return time_!
        }
        
        return time_!
    }
    
    var comment: UILabel {
        if comment_ == nil {
            comment_ = UILabel()
            comment_?.textAlignment = .left
            comment_?.textColor = Color.hex333333
            comment_?.font = Font.size15
            
            return comment_!
        }
        
        return comment_!
    }
    
    var likeIcon: UIButton {
        if likeIcon_ == nil {
            likeIcon_ = UIButton()
            likeIcon_?.setImage(UIImage(named: Icon.like), for: .normal)
            likeIcon_?.setImage(UIImage(named: Icon.likeOn), for: .selected)
            
            return likeIcon_!
        }
        
        return likeIcon_!
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
    
    var commentIcon: UIButton {
        if commentIcon_ == nil {
            commentIcon_ = UIButton()
            commentIcon_?.setImage(UIImage(named: Icon.comment), for: .normal)
            
            return commentIcon_!
        }
        
        return commentIcon_!
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
