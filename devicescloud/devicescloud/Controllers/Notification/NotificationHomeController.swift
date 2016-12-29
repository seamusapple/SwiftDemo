//
//  NotificationHomeController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/1.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class NotificationHomeController: BaseController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        addPageViews()
        layoutPageViews()
        setPageViews()
    }
    
    // MARK: - Controller Settings
    func setNavigationBar() {
        setNaviBar(type: .search)
        setNaviBar(title: TextStr.notification)
        setNaviRightBtn(type: .search, action: #selector(NotificationHomeController.goSearch))
    }
    
    // MARK: - View Settings
    func addPageViews() {
        
    }
    
    func layoutPageViews() {
        
    }
    
    func setPageViews() {
        
    }
    
    
    // MARK: - Event Responses
    @objc fileprivate func goSearch() {
        let searchController = SearchController(searchType: .notification)
        let searchNav = UINavigationController(rootViewController: searchController)
        searchNav.transitioningDelegate = self
        present(searchNav, animated: true) {
            searchController.searchController.isActive = true
        }
    }
    
    // MARK: - Controller Attributes
    fileprivate var searchController_: UISearchController?
}

// MARK: - Getters and Setters
extension NotificationHomeController {
    fileprivate var searchController: UISearchController {
        if searchController_ == nil {
            searchController_ = UISearchController(searchResultsController: nil)
            searchController_?.searchResultsUpdater = self
//            searchController_?.searchBar.delegate = self
            searchController_?.hidesNavigationBarDuringPresentation = false
            return searchController_!
        }
        
        return searchController_!
    }
}

extension NotificationHomeController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

// MARK: - UIViewControllerTransitioningDelegate
extension NotificationHomeController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
}
