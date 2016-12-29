//
//  Animator.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/16.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class PresentAnimator: NSObject {
    let duration = 0.5
    let startPoint = CGPoint(x: Size.screenWidth - CGFloat(27), y: CGFloat(32))
    var bubble = UIView()
    
    func frameForAnimationView(originalCenter: CGPoint, originalSize: CGSize, start: CGPoint) -> CGRect {
        let lengthX = fmax(start.x, originalSize.width - start.x)
        let lengthY = fmax(start.y, originalSize.height - start.y)
        let offset = sqrt(lengthX * lengthX + lengthY * lengthY) * 2
        let size = CGSize(width: offset, height: offset)
        
        return CGRect(origin: CGPoint.zero, size: CGSize(width: size.width, height: size.height))
    }
}

// UIViewControllerAnimatedTransitioning Delegate
extension PresentAnimator: UIViewControllerAnimatedTransitioning {
    // 设置动画时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(duration)
    }
    
    // 设置动画效果
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // 获得容器
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        let originCenter = toView?.center
        let originSize = toView?.frame.size
        bubble.frame = frameForAnimationView(originalCenter: originCenter!, originalSize: originSize!, start: startPoint)
        bubble.layer.cornerRadius = bubble.frame.size.height / 2;
        bubble.center = startPoint
        bubble.backgroundColor = Color.hexwhite
        bubble.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        containerView.addSubview(bubble)
        
        toView?.center = startPoint
        toView?.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        toView?.backgroundColor = Color.hexwhite
        containerView.addSubview(toView!)
        
        UIView.animate(withDuration: TimeInterval(duration), animations: { 
            self.bubble.transform = CGAffineTransform.identity
            toView?.transform = CGAffineTransform.identity
            toView?.center = originCenter!
        }) { (Bool) in
            let wasCancelled = transitionContext.transitionWasCancelled
            transitionContext.completeTransition(!wasCancelled)
            self.bubble.removeFromSuperview()
        }
    }
}

class DismissAnimator: NSObject {
    let duration = 0.3
    let startPoint = CGPoint(x: Size.screenWidth - CGFloat(27), y: CGFloat(32))
    var bubble = UIView()
    
    func frameForAnimationView(originalCenter: CGPoint, originalSize: CGSize, start: CGPoint) -> CGRect {
        let lengthX = fmax(start.x, originalSize.width - start.x)
        let lengthY = fmax(start.y, originalSize.height - start.y)
        let offset = sqrt(lengthX * lengthX + lengthY * lengthY) * 2
        let size = CGSize(width: offset, height: offset)
        
        return CGRect(origin: CGPoint.zero, size: CGSize(width: size.width, height: size.height))
    }
}

// UIViewControllerAnimatedTransitioning Delegate
extension DismissAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(duration)
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        let originCenter = toView?.center
        let originSize = toView?.frame.size
        
        bubble.frame = frameForAnimationView(originalCenter: originCenter!, originalSize: originSize!, start: startPoint)
        bubble.layer.cornerRadius = bubble.frame.size.height / 2
        bubble.backgroundColor = Color.hexwhite
        bubble.center = startPoint
        
        toView?.center = originCenter!
        toView?.transform = CGAffineTransform.identity
        fromView?.transform = CGAffineTransform.identity
        containerView.addSubview(toView!)
        containerView.addSubview(bubble)
        containerView.bringSubview(toFront: fromView!)
        
        UIView.animate(withDuration: TimeInterval(duration), animations: {
            fromView?.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            fromView?.center = self.startPoint
            fromView?.alpha = 0
            self.bubble.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        }) { (Bool) in
            self.bubble.removeFromSuperview()
            let wasCancelled = transitionContext.transitionWasCancelled
            transitionContext.completeTransition(!wasCancelled)
        }
    }
}

