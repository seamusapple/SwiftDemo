//
//  DiscoveryCommentListView.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/21.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class DiscoveryCommentListViewController: BaseController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        addPageViews()
        layoutPageViews()
        setPageViews()
    }
    
    // MARK: - Init Methods
    
    // MARK: - Controller Settings
    private func setNavigationBar() {
        setNaviBar(type: .normal)
        setNaviBar(title: "评论 4")
    }
    
    private func addPageViews() {
        view.addSubview(tableView)
        view.addSubview(commentButton)
    }
    
    private func layoutPageViews() {
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.top.equalTo(view)
            ConstraintMaker.bottom.equalTo(commentButton.snp.top)
        }
        
        commentButton.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(tableView.snp.bottom)
            ConstraintMaker.height.equalTo(50)
            ConstraintMaker.left.right.bottom.equalTo(view)
        }
    }
    
    private func setPageViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = CGFloat(88)
        tableView.rowHeight = UITableViewAutomaticDimension
        
        commentButton.commentButton.addTarget(self, action: #selector(DiscoveryCommentListViewController.comment(sender:)), for: .touchUpInside)
        
        view.backgroundColor = Color.hexwhite
    }
    
    // MARK: - Event Responses
    @objc fileprivate func likeComment(sender: UIButton) {
        let cell = sender.superview?.superview as! DiscoveryCommentListCell
        let indexPath = tableView.indexPath(for: cell)
        print(cell.likeIcon.isSelected)
        print("IM here")
        cell.likeIcon.isSelected = !cell.likeIcon.isSelected
        print(cell.likeIcon.isSelected)
        tableView.reloadRows(at: [indexPath!], with: .none)
        print(cell.likeIcon.isSelected)
    }
    
    @objc fileprivate func comment(sender: UIButton) {
        var authorName = ""
        if let cell = sender.superview?.superview as? DiscoveryCommentListCell {
            authorName = cell.name.text!
        }
        
        let commentVC = DiscoveryCommentPublishController(authorName: authorName)
        let commentNavi = UINavigationController(rootViewController: commentVC)
        present(commentNavi, animated: true, completion: nil)
    }
    
    // MARK: - Private Methods
    
    // MARK: - Controller Attributes
    fileprivate var tableView_: UITableView?
    fileprivate var commentButton_: DiscoveryCommentButtonView?

}

// MARK: - Getters and Setters
extension DiscoveryCommentListViewController {
    fileprivate var tableView: UITableView {
        if tableView_ == nil {
            tableView_ = UITableView()
            tableView_?.allowsSelection = false
            tableView_?.separatorStyle = .none
            tableView_?.showsVerticalScrollIndicator = false
            tableView_?.register(DiscoveryCommentListCell.self, forCellReuseIdentifier: String(describing: DiscoveryCommentListCell.self))
            
            return tableView_!
        }
        
        return tableView_!
    }
    
    fileprivate var commentButton: DiscoveryCommentButtonView {
        if commentButton_ == nil {
            commentButton_ = DiscoveryCommentButtonView()
            
            return commentButton_!
        }
        
        return commentButton_!
    }
}

// MARK: - UITableView Delegate and DataSource
extension DiscoveryCommentListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DiscoveryCommentListCell.self), for: indexPath
            ) as! DiscoveryCommentListCell
        let data = [
            ["happyjune135", "heyujun", "happyjune135", "heyujun"],
            ["2016/10/30", "2016/10/25", "2016/10/21", "2016/9/21"],
            ["@heyujun 那太厉害了，在下佩服佩服！", "@happyjune135 肯定的呀", "这个是真实数据么？", "这个实用"],
            ["8", "12", "8", "12"],
            ["s_03", "s_10", "s_03", "s_10"]
        ]
        cell.name.text = data[0][indexPath.row]
        cell.time.text = data[1][indexPath.row]
        cell.comment.text = data[2][indexPath.row]
        cell.likeNum.text = data[3][indexPath.row]
        cell.avatar.image = UIImage(named: data[4][indexPath.row])
        
        if indexPath.row == 0 || indexPath.row == 2 {
            cell.likeIcon.isSelected = true
        }
        
        cell.likeIcon.tag = indexPath.row
        cell.commentIcon.tag = indexPath.row
        cell.likeIcon.addTarget(self, action: #selector(DiscoveryCommentListViewController.likeComment(sender:)), for: .touchUpInside)
        cell.commentIcon.addTarget(self, action: #selector(DiscoveryCommentListViewController.comment(sender:)), for: .touchUpInside)
        
        return cell
    }
}

extension DiscoveryCommentListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DiscoveryAppDetailController()
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
