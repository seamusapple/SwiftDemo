//
//  NotificaitonHomeEventCell.swift
//  devicescloud
//
//  Created by 世宇 汤 on 2016/12/6.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class NotificaitonEventCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        addPageView()
        layoutPageViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func addPageView() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(markLabel)
        contentView.addSubview(levelLabel)
        contentView.addSubview(valueLabel)
        contentView.addSubview(seperator)
        contentView.addSubview(seperatorBottom)
    }
    
    func layoutPageViews() {
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(15)
            make.top.equalTo(contentView).offset(15)
            make.bottom.equalTo(nameLabel.snp.top).offset(-10)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalTo(titleLabel)
            make.bottom.equalTo(levelLabel.snp.top).offset(-7)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLabel)
            make.right.equalTo(contentView).offset(-15)
        }
        
        markLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(nameLabel)
            make.left.equalTo(nameLabel.snp.right).offset(10)
            make.height.equalTo(18)
        }
        
        levelLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(7)
            make.bottom.equalTo(contentView).offset(-13)
        }
        
        valueLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(levelLabel)
            make.left.equalTo(levelLabel.snp.right).offset(36)
        }
        
        seperator.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(titleLabel)
            ConstraintMaker.right.equalTo(contentView).offset(-15)
            ConstraintMaker.bottom.equalTo(contentView)
            ConstraintMaker.height.equalTo(1 / Size.screenScale)
        }
        
        seperatorBottom.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.bottom.equalTo(contentView)
            ConstraintMaker.height.equalTo(1 / Size.screenScale)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    fileprivate var titleLabel_ : UILabel?
    fileprivate var nameLabel_ : UILabel?
    fileprivate var markLabel_ : UILabel?
    fileprivate var timeLabel_ : UILabel?
    fileprivate var levelLabel_ : UILabel?
    fileprivate var valueLabel_ : UILabel?
    fileprivate var seperator_: UIView?
    fileprivate var seperatorBottom_: UIView?
    
    var mark : String = "" {
        didSet {
            titleLabel.text = "您的设备触发了" + mark + "事件"
            markLabel.text = "  " + mark + "  "
            
            markLabel.backgroundColor = Color.hexf4b940
            
        }
    }
    
    var level : String = "" {
        didSet {
            levelLabel.text = "触发级别：" + level
        }
    }
    
    var name : String = "" {
        didSet {
            nameLabel.text = name
        }
    }
    
    var time : String = "" {
        didSet {
            timeLabel.text = time
        }
    }
    
    var value : String = "" {
        didSet {
            valueLabel.text = "触发值：" + value
        }
    }

}

extension NotificaitonEventCell {
    
    
    fileprivate var titleLabel : UILabel {
        if titleLabel_ == nil {
            titleLabel_ = UILabel()
        }
        
        titleLabel_?.textColor = Color.hex666666
        titleLabel_?.font = Font.size12
        
        return titleLabel_!
    }
    
    fileprivate var nameLabel : UILabel {
        if nameLabel_ == nil {
            nameLabel_ = UILabel()
        }
        
        nameLabel_?.textColor = Color.hex333333
        nameLabel_?.font = Font.size14
        
        return nameLabel_!
    }
    
    fileprivate var markLabel : UILabel {
        if markLabel_ == nil {
            markLabel_ = UILabel()
        }
        
        markLabel_?.textColor = Color.hexwhite
        markLabel_?.font = Font.size12
        markLabel_?.layer.cornerRadius = 3
        markLabel_?.clipsToBounds = true
        
        return markLabel_!
    }
    
    fileprivate var timeLabel : UILabel {
        if timeLabel_ == nil {
            timeLabel_ = UILabel()
        }
        
        timeLabel_?.textColor = Color.hex999999
        timeLabel_?.font = Font.size12
        
        return timeLabel_!
    }
    
    fileprivate var levelLabel : UILabel {
        if levelLabel_ == nil {
            levelLabel_ = UILabel()
        }
        
        levelLabel_?.textColor = Color.hex333333
        levelLabel_?.font = Font.size14
        
        return levelLabel_!
    }
    
    fileprivate var valueLabel : UILabel {
        if valueLabel_ == nil {
            valueLabel_ = UILabel()
        }
        
        valueLabel_?.textColor = Color.hex333333
        valueLabel_?.font = Font.size14
        
        return valueLabel_!
    }
    
    var seperator: UIView {
        if seperator_ == nil {
            seperator_ = UIView()
            seperator_?.backgroundColor = Color.hexe6e6e6
            
            return seperator_!
        }
        
        return seperator_!
    }

    var seperatorBottom: UIView {
        if seperatorBottom_ == nil {
            seperatorBottom_ = UIView()
            seperatorBottom_?.backgroundColor = Color.hexe2e3e5
            seperatorBottom_?.isHidden = true
            
            return seperatorBottom_!
        }
        
        return seperatorBottom_!
    }
}
