//
//  DiscoveryShareViewController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/20.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit
import SwiftyJSON
import MBProgressHUD

enum SocialType {
    case QQ
    case WX
    case WB
}

class DiscoveryShareViewController: BaseController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        addPageViews()
        layoutPageViews()
        setPageViews()
    }
    
    // MARK: - Init Methods
    init() {
        super.init(nibName: nil, bundle: nil)
        shareViewData = ShareHelper.sharedInstance.getShareItem()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Controller Settings
    private func setNavigationBar() {
        setNaviBar(type: .blank)
    }
    
    private func addPageViews() {
        view.addSubview(backView)
        view.addSubview(scroller)
    }
    
    private func layoutPageViews() {
        backView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalTo(view)
        }
        
        scroller.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(view).offset(10)
            ConstraintMaker.right.bottom.equalTo(view).offset(-10)
            ConstraintMaker.height.equalTo(187.5)
        }
    }
    
    private func setPageViews() {
        view.backgroundColor = Color.hexclear
        tapRecognizer.addTarget(self, action: #selector(DiscoveryShareViewController.viewDismiss))
        backView.addGestureRecognizer(tapRecognizer)
    }
    
    // MARK: - Event Responses
    
    // MARK: - Private Methods
    
    // MARK: - Controller Attributes
    fileprivate var scroller_: HorizontalScroller?
    fileprivate var backView_: UIView?
    fileprivate var tapRecognizer_: UITapGestureRecognizer?
    fileprivate var shareViewData: [[String]]!
}

// MARK: - Getters and Setters
extension DiscoveryShareViewController {
    fileprivate var scroller: HorizontalScroller {
        if scroller_ == nil {
            scroller_ = HorizontalScroller()
            scroller_?.layer.cornerRadius = CGFloat(13)
            scroller_?.layer.masksToBounds = true
            scroller_?.delegate = self
            
            return scroller_!
        }
        
        return scroller_!
    }
    
    fileprivate var backView: UIView {
        if backView_ == nil {
            backView_ = UIView()
            backView_?.backgroundColor = Color.hex000000Alpha40
            
            return backView_!
        }
        
        return backView_!
    }
    
    fileprivate var tapRecognizer: UITapGestureRecognizer {
        if tapRecognizer_ == nil {
            tapRecognizer_ = UITapGestureRecognizer()
            
            return tapRecognizer_!
        }
        
        return tapRecognizer_!
    }
}

// MARK: - HorizontalScrollerDelegate
extension DiscoveryShareViewController: HorizontalScrollerDelegate {
    func numberOfViewsForHorizontalScroller(scroller: HorizontalScroller) -> Int {
        return shareViewData[0].count
    }
    
    func horizontalScrollerClickedViewAtIndex(scroller: HorizontalScroller, index: Int) {
        let view = scroller.viewAt(index: index) as! ShareView
//        ShareHelper.sharedInstance.gotoShare(at: index, with: <#T##[JSON]#>)
        ShareHelper.sharedInstance.gotoShare(for: view.shareName.text!)
    }
    
    func horizontalScrollerViewAtIndex(scroller: HorizontalScroller, index: Int) -> UIView {
        let shareView = ShareView()
        shareView.shareIcon.image = UIImage(named: shareViewData[0][index])
        shareView.shareName.text = shareViewData[1][index]
        
        return shareView
    }
}
