//
//  DiscoveryAppDetailController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/19.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit
import MBProgressHUD

class DiscoveryAppDetailController: BaseController {

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
        setNaviRightBtn(type: .share, action: #selector(DiscoveryAppDetailController.share))
    }
    
    private func addPageViews() {
        let bt = UIButton()
        view.addSubview(bt)
        bt.backgroundColor = Color.hexe6e6e6
        bt.setTitle("我可以点", for: .normal)
        bt.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.size.equalTo(CGSize(width: 100, height: 100))
            ConstraintMaker.left.top.equalTo(view)
        }
        bt.addTarget(self, action: #selector(DiscoveryAppDetailController.ceshi), for: .touchUpInside)
        
        let btt = UIButton()
        view.addSubview(btt)
        btt.backgroundColor = Color.hex7a7e89
        btt.setTitle("我可以点", for: .normal)
        btt.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.size.equalTo(CGSize(width: 100, height: 100))
            ConstraintMaker.right.top.equalTo(view)
        }
        btt.addTarget(self, action: #selector(DiscoveryAppDetailController.ceeshi), for: .touchUpInside)
    }
    
    private func layoutPageViews() {

    }
    
    private func setPageViews() {

    }
    
    // MARK: - Event Responses
    func ceshi() {
        let devc = DiscoveryConstructorController()
        devc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(devc, animated: true)
    }
    
    func ceeshi() {
        let devc = DiscoveryCommentListViewController()
        devc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(devc, animated: true)
    }
    
    func share() {
//        let shareVC = DiscoveryShareViewController()
        shareVC.modalPresentationStyle = .overFullScreen
        shareVC.modalTransitionStyle = .crossDissolve
        shareVC.providesPresentationContextTransitionStyle = true
        shareVC.definesPresentationContext = true
        present(shareVC, animated: true, completion: nil)
        
        ShareHelper.sharedInstance.delegate = self
    }
    
    // MARK: - Private Methods
    
    // MARK: - Controller Attributes
    let shareVC = DiscoveryShareViewController()
}

extension DiscoveryAppDetailController: ShareCallBackDelegate {
    func shareDidSucess(by platFormType: SSDKPlatformType) {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .text

        switch platFormType {
            
        case .typeCopy:
            hud.label.text = "链接已复制"
            
        default:
            hud.label.text = "分享成功"
        }
        
        hud.hide(animated: true, afterDelay: TimeInterval(1.5))
    }
    
    func shareDidFail(by platFormType: SSDKPlatformType) {
        let hud = MBProgressHUD.showAdded(to: shareVC.view, animated: true)
        hud.mode = .text
        
        switch platFormType {
            
        case .typeCopy:
            hud.label.text = "链接复制失败，请重试"
            
        default:
            hud.label.text = "分享失败，请重试"
        }
        
        hud.hide(animated: true, afterDelay: TimeInterval(1.5))
    }
    
    func shareDidCancle() {
        let hud = MBProgressHUD.showAdded(to: shareVC.view, animated: true)
        hud.label.text = "分享已取消"
        hud.mode = .text
        hud.hide(animated: true, afterDelay: TimeInterval(1.5))
    }
}
