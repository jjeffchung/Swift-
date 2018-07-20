//
//  CircularAnimation.swift
//  animationsAndTransitions
//
//  Created by John Jeffrey Chung on 7/18/18.
//  Copyright © 2018 John Jeffrey Chung. All rights reserved.
//

import UIKit

class CircularAnimation: NSObject {

    var circleShape = UIView()
    
    var beginningPoint = CGPoint.zero {
        didSet {
            circleShape.center = beginningPoint
        }
    }
    
    var circleColor = UIColor.white
    
    var duration = 0.3
    
    enum CircularTransition: Int {
        case present, dismiss, pop
    }
    
    var transitionMode: CircularTransition = .present
}

extension CircularAnimation: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) { //All of the animation code will be stored in this function
        let containerView = transitionContext.containerView
        
        if transitionMode == .present {
            if let presentedViewDisplay = transitionContext.view(forKey: UITransitionContextViewKey.to){
                let viewCenterDisplay = presentedViewDisplay.center
                let viewSize = presentedViewDisplay.frame.size
                
                circleShape = UIView()
                
                circleShape.frame = frameForCircle(withViewCenter: viewCenterDisplay, size: viewSize, startPoint: beginningPoint)
                circleShape.layer.cornerRadius = circleShape.frame.size.height / 2
                circleShape.center = beginningPoint
                circleShape.backgroundColor = circleColor
                circleShape.transform = CGAffineTransform (scaleX: 0.001, y: 0.001)
                containerView.addSubview(circleShape)
                
                presentedViewDisplay.center = beginningPoint
                presentedViewDisplay.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                presentedViewDisplay.alpha = 0
                containerView.addSubview(presentedViewDisplay)
                
                UIView.animate(withDuration: duration, animations: {
                    self.circleShape.transform = CGAffineTransform.identity
                    presentedViewDisplay.transform = CGAffineTransform.identity
                    presentedViewDisplay.alpha = 1
                    presentedViewDisplay.center = viewCenterDisplay
                }, completion: {(success: Bool) in
                    transitionContext.completeTransition(success)
                })
            }
        } else {
            let transitionModeKey = (transitionMode == .pop) ? UITransitionContextViewKey.to : UITransitionContextViewKey.from
            
            if let returningViewDisplay = transitionContext.view(forKey: transitionModeKey) {
                let viewCenterDisplay = returningViewDisplay.center
                let viewSize = returningViewDisplay.frame.size
                
                circleShape.frame = frameForCircle(withViewCenter: viewCenterDisplay, size: viewSize, startPoint: beginningPoint)
                circleShape.layer.cornerRadius = circleShape.frame.size.height / 2
                circleShape.center = beginningPoint
                
                UIView.animate(withDuration: duration, animations: {
                    self.circleShape.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returningViewDisplay.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returningViewDisplay.center = self.beginningPoint
                    returningViewDisplay.alpha = 0
                    
                    if self.transitionMode == .pop {
                        containerView.insertSubview(returningViewDisplay, belowSubview: returningViewDisplay)
                        containerView.insertSubview(self.circleShape, belowSubview: returningViewDisplay)
                    }
                    
                }, completion: { (success: Bool) in
                    returningViewDisplay.center = viewCenterDisplay
                    returningViewDisplay.removeFromSuperview()
                    
                    self.circleShape.removeFromSuperview()
                    
                    transitionContext.completeTransition(success)
                    
                })
                
            }
            
        }
    }
    
    func frameForCircle (withViewCenter viewCenter: CGPoint, size viewSize: CGSize, startPoint: CGPoint) -> CGRect {
        let xLength = fmax (startPoint.x, viewSize.width - startPoint.x)
        let yLength = fmax(startPoint.y, viewSize.height - startPoint.y)
        let offsetVector = sqrt (xLength * xLength + yLength * yLength) * 2 //We use the whole screen
        let size = CGSize (width: offsetVector, height: offsetVector)
        
        return CGRect(origin: CGPoint.zero, size: size)
    }
    
}

