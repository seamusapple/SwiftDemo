//
//  DiscoveryCommentPublishController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/21.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class DiscoveryCommentPublishController: BaseController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        addPageViews()
        setPageViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(DiscoveryCommentPublishController.keyboardShow(noti:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Init Methods
    init(authorName: String?) {
        super.init(nibName: nil, bundle: nil)
        self.authorName = authorName
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Controller Settings
    private func setNavigationBar() {
        setNaviBar(type: .text)
        setNaviBar(title: TextStr.publishComment)
        setNaviTextBtn(leftText: TextStr.cancle, actionType: .dismiss, rightText: TextStr.publish, rightAction: #selector(DiscoveryCommentPublishController.publishComment))
    }
    
    private func addPageViews() {
        view.addSubview(commentView)
    }
    
    private func setPageViews() {
        commentView.delegate = self
        
        if authorName != "" {
            commentView.text = "@\(authorName!)" + " "
        } else {
            commentView.text = TextStr.writeComment
            commentView.textColor = Color.hexcccccc
            commentView.selectedTextRange = commentView.textRange(from: commentView.beginningOfDocument, to: commentView.beginningOfDocument)
        }
        
        commentView.becomeFirstResponder()
    }
    
    // MARK: - Event Responses
    @objc fileprivate func publishComment() {
        print("这里要放飞请求了")
    }
    
    @objc private func keyboardShow(noti: Notification) {
        let userinfo: NSDictionary = noti.userInfo! as NSDictionary
        
        let nsValue = userinfo.object(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        
        let keyboardRec = nsValue.cgRectValue
        
        let height = keyboardRec.size.height
        
        let textViewHeight = view.frame.size.height - height - CGFloat(15)
        
        commentView.snp.removeConstraints()
        
        commentView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.top.equalTo(view).offset(15)
            ConstraintMaker.right.equalTo(view).offset(-15)
            ConstraintMaker.height.equalTo(textViewHeight)
        }
    }
    
    // MARK: - Private Methods
    
    // MARK: - Controller Attributes
    fileprivate var commentView_: UITextView?
    fileprivate var authorName: String?
}

// MARK: - Getters and Setters
extension DiscoveryCommentPublishController {
    fileprivate var commentView: UITextView {
        if commentView_ == nil {
            commentView_ = UITextView()
            commentView_?.textColor = Color.hex333333
            commentView_?.font = Font.size16
            
            return commentView_!
        }
        
        return commentView_!
    }
}

// MARK: - UITextView Delegate
extension DiscoveryCommentPublishController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if let newRange = textView.text.range(from: range) {
            let currentText = textView.text
            let updateText = currentText?.replacingCharacters(in: newRange, with: text)
            
            if (updateText?.isEmpty)! {
                textView.text = TextStr.writeComment
                textView.textColor = Color.hexcccccc
                
                textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
                
                navigationItem.rightBarButtonItem?.isEnabled = false
                
                return false
            } else if textView.textColor == Color.hexcccccc && !text.isEmpty {
                
                textView.text = nil
                textView.textColor = Color.hex333333
            } else if (!(updateText?.isEmpty)!) {
                
                if updateText == String("@\(self.authorName!)" + " ") || updateText == TextStr.writeComment {
                    
                    navigationItem.rightBarButtonItem?.isEnabled = false
                } else {
                    
                    navigationItem.rightBarButtonItem?.isEnabled = true
                }
            }
        }
        return true
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        if self.view.window != nil {
            if textView.textColor == Color.hexcccccc {
                textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
            }
        }
    }
}
