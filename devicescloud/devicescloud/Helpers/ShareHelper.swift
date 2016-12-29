//
//  ShareHelper.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/22.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol ShareCallBackDelegate: class {
    func shareDidSucess(by platFormType: SSDKPlatformType)
    func shareDidFail(by platFormType: SSDKPlatformType)
    func shareDidCancle()
}

class ShareHelper {
    
    private var shareViewData = [
        [Icon.shareQQ, Icon.shareWechat, Icon.shareFriends, Icon.shareWeibo, Icon.shareQzone, Icon.shareCopy],
        [TextStr.shareQQ, TextStr.shareWechat, TextStr.shareFriends, TextStr.shareWeibo, TextStr.shareQzone, TextStr.shareCopy]
    ]
    
    weak var delegate: ShareCallBackDelegate? = nil
    
    //MARK: - life cycle
    static let sharedInstance = ShareHelper()

    private init() {}
    
    //MARK: - public method
    func initShare() {
        ShareSDK.registerApp("a21e18b752e0",
                             activePlatforms: [SSDKPlatformType.typeSinaWeibo.rawValue,
                                               SSDKPlatformType.typeQQ.rawValue,
                                               SSDKPlatformType.typeWechat.rawValue,
                                               SSDKPlatformType.typeCopy.rawValue],
                             onImport: { (platform) in
                                switch platform {
                                    
                                case .typeWechat:
                                    ShareSDKConnector.connectWeChat(WXApi.classForCoder())
                                    
                                case .typeQQ:
                                    ShareSDKConnector.connectQQ(QQApiInterface.classForCoder(), tencentOAuthClass: TencentOAuth.classForCoder())
                                    
                                case .typeSinaWeibo:
                                    ShareSDKConnector.connectWeibo(WeiboSDK.classForCoder())
                                    
                                default:
                                    break
                                }
        }) { (platform, appinfo) in
            switch platform {
                
            case .typeWechat:
                appinfo?.ssdkSetupWeChat(byAppId: "wx82973a116cdda17e", appSecret: "d7a8357101f7f0dd78f92b55e196c001")
                
            case .typeQQ:
                appinfo?.ssdkSetupQQ(byAppId: "1105219978", appKey: "HEMEWEUH0Pf9gwjA", authType: SSDKAuthTypeBoth)
                
            case .typeSinaWeibo:
                appinfo?.ssdkSetupSinaWeibo(byAppKey: "1333026531", appSecret: "1aa612eda0e856b9a338c6c0e9540d8d", redirectUri: "http://sns.whalecloud.com/sina2/callback", authType: SSDKAuthTypeBoth)
            default:
                break
            }
        }
    }
    
    func getShareItem() -> [[String]] {
        setShare()
        return shareViewData
    }
    
//    func gotoShare(at: Int, with: [JSON]) {
//    }
    
    func gotoShare(for shareName: String) {
        var shareType: SSDKPlatformType?
        var contentType: SSDKContentType = .webPage
        var shareTitle = ""
        let shareParames = NSMutableDictionary()
        
        switch shareName {
        
        case TextStr.shareQQ:
            shareType = SSDKPlatformType.subTypeQQFriend
            
        case TextStr.shareWechat:
            shareType = SSDKPlatformType.subTypeWechatSession
            
        case TextStr.shareFriends:
            shareType = SSDKPlatformType.subTypeWechatTimeline
            
        case TextStr.shareWeibo:
            shareType = SSDKPlatformType.typeSinaWeibo
            contentType = SSDKContentType.image
            shareParames.ssdkEnableUseClientShare()
            shareTitle = "OneNET云平台"
            shareTitle += "  "
            shareTitle += "http://open.iot.10086.cn"
            
        case TextStr.shareQzone:
            shareType = SSDKPlatformType.subTypeQZone
            
        case TextStr.shareCopy:
            shareType = SSDKPlatformType.typeCopy
            
        default:
            break
        }
        
        let shareUrl = URL(string: "http://open.iot.10086.cn")!
//        let shareImage = NSURL(string: "img_03")!
        let shareImage = UIImage(named: "img_03")
        
        shareParames.ssdkSetupShareParams(byText: shareTitle,
                                          images: shareImage,
                                          url: shareUrl,
                                          title: "OneNET云平台",
                                          type: contentType)
        
        // 进行分享
        ShareSDK.share(shareType!,
                       parameters: shareParames) { (state, userData: [AnyHashable : Any]?, contentEntity: SSDKContentEntity?, error: Error?) in
                        switch state {
                            
                        case SSDKResponseState.success:
                            switch shareType! {
                                
                            case SSDKPlatformType.typeCopy:
                                self.delegate?.shareDidSucess(by: .typeCopy)
                                
                            case SSDKPlatformType.typeSinaWeibo:
                                
                                self.delegate?.shareDidSucess(by: .typeSinaWeibo)
                                
                            default:
                                self.delegate?.shareDidSucess(by: .subTypeQQFriend)
                            }
                            
                            if let topViewController = UIApplication.topViewController() {
                                topViewController.dismiss(animated: true, completion: nil)
                            }
                            
                        case SSDKResponseState.fail:
                            switch shareType! {
                                
                            case SSDKPlatformType.typeCopy:
                                self.delegate?.shareDidFail(by: .typeCopy)
                                
                            default:
                                self.delegate?.shareDidSucess(by: .subTypeQQFriend)
                            }
                            
                            print("分享失败,错误描述:\(error)")
                            
                        case SSDKResponseState.cancel:
                            self.delegate?.shareDidCancle()
                            print("分享取消")
                            
                        default:
                            break
                        }
        }
    }
    
    // MARK: - Private Methods
    private func setShare() {
        if !WXApi.isWXAppInstalled() {
            remove(socialType: .WX)
        }
        
        if !WeiboSDK.isWeiboAppInstalled() {
            remove(socialType: .WB)
        }
        
        if !QQApiInterface.isQQInstalled() {
            remove(socialType: .QQ)
        }
    }
    
    private func remove(socialType: SocialType) {
        switch socialType {
            
        case .QQ:
            removeValueFromArray(value: Icon.shareQzone, array: &shareViewData[0])
            removeValueFromArray(value: Icon.shareQQ, array: &shareViewData[0])
            removeValueFromArray(value: TextStr.shareQzone, array: &shareViewData[1])
            removeValueFromArray(value: TextStr.shareQQ, array: &shareViewData[1])
            
        case .WX:
            removeValueFromArray(value: Icon.shareWechat, array: &shareViewData[0])
            removeValueFromArray(value: Icon.shareFriends, array: &shareViewData[0])
            removeValueFromArray(value: TextStr.shareWechat, array: &shareViewData[1])
            removeValueFromArray(value: TextStr.shareFriends, array: &shareViewData[1])
            
        case .WB:
            removeValueFromArray(value: Icon.shareWeibo, array: &shareViewData[0])
            removeValueFromArray(value: TextStr.shareWeibo, array: &shareViewData[1])
        }
    }
    
    //获取正确的删除索引
    private func getRemoveIndex<T: Equatable>(value: T, array: [T]) -> [Int]{
        
        var indexArray = [Int]()
        var correctArray = [Int]()
        
        
        //获取指定值在数组中的索引
        for (index,_) in array.enumerated() {
            if array[index] == value {
                indexArray.append(index)
            }
        }
        
        //计算正确的删除索引
        for (index, originIndex) in indexArray.enumerated(){
            //指定值索引减去索引数组的索引
            let correctIndex = originIndex - index
            
            //添加到正确的索引数组中
            correctArray.append(correctIndex)
        }
        
        return correctArray
    }
    
    
    //从数组中删除指定元素
    private func removeValueFromArray<T: Equatable>(value: T, array: inout [T]){
        
        let correctArray = getRemoveIndex(value: value, array: array)
        
        //从原数组中删除指定元素
        for index in correctArray{
            array.remove(at: index)
        }
    }
}
