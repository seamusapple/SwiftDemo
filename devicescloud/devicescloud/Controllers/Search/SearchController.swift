//
//  SearchController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/16.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class SearchController: BaseController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        addPageViews()
        layoutPageViews()
        setPageViews()
    }
    
    // MARK: - Init Methods
    init(searchType: SearchType) {
        self.searchType = searchType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Controller Settings
    private func setNavigationBar() {
        setNaviBar(type: .search)
        setSearchController(type: self.searchType, searchController: searchController)
    }
    
    private func addPageViews() {
        view.addSubview(tableView)
    }
    
    private func layoutPageViews() {
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalTo(view)
        }
    }
    
    private func setPageViews() {
        tableView.delegate = self
        tableView.dataSource = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.delegate = self
    }
    
    // MARK: - Event Responses
    
    // MARK: - Private Methods
    
    // MARK: - Controller Attributes
    fileprivate var tableView_: UITableView?
    fileprivate var searchController_: UISearchController?
    
    fileprivate var searchType: SearchType!
}

// MARK: - Getters and Setters
extension SearchController {
    fileprivate var tableView: UITableView {
        if tableView_ == nil {
            tableView_ = UITableView(frame: CGRect.zero, style: .grouped)
            tableView_?.allowsSelection = false
            tableView_?.separatorStyle = .none
            tableView_?.showsVerticalScrollIndicator = false
            tableView_?.backgroundColor = Color.hexwhite
            tableView_?.register(ProductHomeSearchCell.self, forCellReuseIdentifier: String(describing: ProductHomeSearchCell.self))
            
            return tableView_!
        }
        
        return tableView_!
    }

    
    var searchController: UISearchController {
        if searchController_ == nil {
            searchController_ = UISearchController(searchResultsController: nil)
            searchController_?.hidesNavigationBarDuringPresentation = false
            
            return searchController_!
        }
        
        return searchController_!
    }
}

//MARK: - Data Source and Delegate
extension SearchController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductHomeSearchCell.self), for: indexPath) as! ProductHomeSearchCell
        cell.searchItem.text = "OneNet"
        return cell
    }
}

extension SearchController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title = ProductHomeSearchHeaderView()
        return title
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        searchController.searchBar.resignFirstResponder()
    }
}

extension SearchController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        tableView.backgroundColor = Color.hexwhite
        return true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        tableView.backgroundColor = Color.hexwhite
        dismiss(animated: true, completion: nil)
    }
}

extension SearchController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        tableView.reloadData()
    }
}

extension SearchController: UISearchControllerDelegate {
    func didPresentSearchController(_ searchController: UISearchController) {
        
        UIView.animate(withDuration: 0.1, animations: { () -> Void in }) { (completed) -> Void in
            searchController.searchBar.becomeFirstResponder()
        }
    }
}
