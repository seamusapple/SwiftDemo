//
//  HorizontalScroller.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/20.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

@objc protocol HorizontalScrollerDelegate {
    // ask the delegate how many views he wants to present inside the horizontal scroller
    func numberOfViewsForHorizontalScroller(scroller: HorizontalScroller) -> Int
    // ask the delegate to return the view that should appear at <index>
    func horizontalScrollerViewAtIndex(scroller: HorizontalScroller, index:Int) -> UIView
    // inform the delegate what the view at <index> has been clicked
    func horizontalScrollerClickedViewAtIndex(scroller: HorizontalScroller, index:Int)
    // ask the delegate for the index of the initial view to display. this method is optional
    // and defaults to 0 if it's not implemented by the delegate
    @objc optional func initialViewIndex(scroller: HorizontalScroller) -> Int
}

class HorizontalScroller: UIView {

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
        addSubview(scrollView)
        addSubview(seperator)
        addSubview(cancleButton)
    }
    
    private func layoutPageViews() {
        scrollView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalTo(self)
            ConstraintMaker.top.equalTo(self).offset(30)
            ConstraintMaker.bottom.equalTo(seperator.snp.top).offset(-25)
        }
        
        seperator.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(scrollView.snp.bottom).offset(25)
            ConstraintMaker.left.right.equalTo(self)
            ConstraintMaker.height.equalTo(1 / Size.screenScale)
        }
        
        cancleButton.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(seperator.snp.bottom)
            ConstraintMaker.left.right.bottom.equalTo(self)
            ConstraintMaker.height.equalTo(55)
        }
    }
    
    private func setPageViews() {
        backgroundColor = Color.hexwhite
        tapRecognizer.addTarget(self, action: #selector(HorizontalScroller.viewTapped(gesture:)))
        cancleButton.addTarget(self, action: #selector(HorizontalScroller.viewDismiss), for: .touchUpInside)
        scrollView.addGestureRecognizer(tapRecognizer)
    }
    // MARK: - Event Response
    @objc private func viewTapped(gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: gesture.view)
        if let delegate = delegate {
            for index in 0..<delegate.numberOfViewsForHorizontalScroller(scroller: self) {
                let view = scrollView.subviews[index] as UIView
                if view.frame.contains(location) {
                    delegate.horizontalScrollerClickedViewAtIndex(scroller: self, index: index)
//                    scrollView.setContentOffset(CGPoint(x: view.frame.origin.x - self.frame.size.width / 2 + view.frame.size.width / 2, y: 0) , animated:true)
                    break
                }
            }
        }
    }
    
    @objc private func viewDismiss() {
        if let topViewController = UIApplication.topViewController() {
            topViewController.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - Private Methods
    internal override func didMoveToSuperview() {
        reload()
    }
    
    fileprivate func centerCurrentView() {
        var xFinal = scrollView.contentOffset.x + CGFloat((VIEWS_OFFSET/2) + VIEW_PADDING)
        let viewIndex = xFinal / CGFloat((VIEW_WIDTH + (2 * VIEW_PADDING)))
        xFinal = viewIndex * CGFloat(VIEW_WIDTH + (2 * VIEW_PADDING))
        scrollView.setContentOffset(CGPoint(x: xFinal, y: 0), animated: true)
        if let delegate = self.delegate {
            delegate.horizontalScrollerClickedViewAtIndex(scroller: self, index: Int(viewIndex))
        }
    }
    
    // MARK: - Public Methods
    func viewAt(index: Int) -> UIView {
        return viewArray[index]
    }
    
    func reload() {
        // 1 - Check if there is a delegate, if not there is nothing to load.
        if let delegate = delegate {
            //2 - Will keep adding new album views on reload, need to reset.
            viewArray = []
            let views: NSArray = scrollView.subviews as NSArray

            // 3 - remove all subviews
            for (_, element) in views.enumerated() {
                let view = element as! UIView
                view.removeFromSuperview()
            }
            
            // 4 - xValue is the starting point of the views inside the scroller
            var xValue = VIEWS_OFFSET
            for index in 0..<delegate.numberOfViewsForHorizontalScroller(scroller: self) {
                // 5 - add a view at the right position
                xValue += VIEW_PADDING
                let view = delegate.horizontalScrollerViewAtIndex(scroller: self, index: index)
                view.frame = CGRect(x: CGFloat(xValue), y: 0, width: CGFloat(VIEW_WIDTH), height: CGFloat(VIEW_HEIGHT))
                scrollView.addSubview(view)
                xValue += VIEW_WIDTH
                
                // 6 - Store the view so we can reference it later
                viewArray.append(view)
            }
            // 7
            scrollView.contentSize = CGSize(width: CGFloat(xValue + VIEWS_OFFSET + VIEW_PADDING), height: frame.size.height)
            
            // 8 - If an initial view is defined, center the scroller on it
            if let initialView = delegate.initialViewIndex?(scroller: self) {
                scrollView.setContentOffset(CGPoint(x: CGFloat(initialView) * CGFloat((VIEW_WIDTH + (2 * VIEW_PADDING))), y: 0), animated: true)
            }
        }
    }
    
    // MARK: - Controller Attributes
    fileprivate var scrollView_: UIScrollView?
    fileprivate var seperator_: UIView?
    fileprivate var cancleButton_: UIButton?
    
    fileprivate var tapRecognizer_: UITapGestureRecognizer?
    weak var delegate: HorizontalScrollerDelegate?
    fileprivate var viewArray = [UIView]()
    
    private let VIEW_PADDING = 20
    private let VIEW_WIDTH = 55
    private let VIEW_HEIGHT = 77
    private let VIEWS_OFFSET = 0
}

// MARK: - Getters and Setters
extension HorizontalScroller {
    fileprivate var scrollView: UIScrollView {
        if scrollView_ == nil {
            scrollView_ = UIScrollView()
            scrollView_?.showsHorizontalScrollIndicator = false
            scrollView_?.translatesAutoresizingMaskIntoConstraints = false
            
            return scrollView_!
        }
        
        return scrollView_!
    }
    
    fileprivate var seperator: UIView {
        if seperator_ == nil {
            seperator_ = UIView()
            seperator_?.backgroundColor = Color.hexe6e6e6
            
            return seperator_!
        }
        
        return seperator_!
    }
    
    fileprivate var cancleButton: UIButton {
        if cancleButton_ == nil {
            cancleButton_ = UIButton()
            cancleButton_?.setTitle(TextStr.cancle, for: .normal)
            cancleButton_?.setTitleColor(Color.hex19bbff, for: .normal)
            
            return cancleButton_!
        }
        
        return cancleButton_!
    }
    
    fileprivate var tapRecognizer: UITapGestureRecognizer {
        if tapRecognizer_ == nil {
            tapRecognizer_ = UITapGestureRecognizer()
            
            return tapRecognizer_!
        }
        
        return tapRecognizer_!
    }
}

extension HorizontalScroller: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            // 暂时不居中
//            centerCurrentView()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        centerCurrentView()
    }
}
