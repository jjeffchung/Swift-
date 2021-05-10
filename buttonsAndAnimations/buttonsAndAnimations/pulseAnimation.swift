//
//  pulseAnimation.swift
//  buttonsAndAnimations
//  An application which makes use of Swift's Core Animation, with the CALayer Class to create animations on image-based content.
//  Created by John Jeffrey Chung on 7/14/18.
//  Copyright © 2018 John Jeffrey Chung. All rights reserved.
//

import UIKit

class pulseAnimation: CALayer {
    
    var animationSet = CAAnimationGroup()
    
    var beginningPulseScale: Float = 0
    var nextPulseAfter: TimeInterval = 0
    var pulsingAnimationDuration: TimeInterval = 1.5
    var radius: CGFloat = 200
    var numberOfPulses: Float = Float.infinity
    
    override init(layer: Any) {
        super.init (layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init (coder: aDecoder)
    }
    
    init (numberOfPulses: Float = Float.infinity, radius:CGFloat, position:CGPoint){
        super.init()
        
        self.backgroundColor = UIColor.black.cgColor
        self.contentsScale = UIScreen.main.scale
        self.opacity = 0
        self.radius = radius
        self.numberOfPulses = numberOfPulses
        self.position = position
        
        self.bounds = CGRect (x:0, y:0, width: radius * 2, height: radius * 2)
        self.cornerRadius = radius
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
             self.setUpAnimationSet()
            
            DispatchQueue.main.async {
                self.add(self.animationSet, forKey: "pulse")
            }
            
        }
    }
    
    func scalingAnimaiton () -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation (keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = NSNumber(value: beginningPulseScale)
        scaleAnimation.toValue = NSNumber(value: 1)
        scaleAnimation.duration = pulsingAnimationDuration
        
        return scaleAnimation
    }
    
    func opacityAnimation() -> CAKeyframeAnimation {
        
        let opacityOfAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityOfAnimation.duration = pulsingAnimationDuration
        opacityOfAnimation.values = [0.4, 0.8, 0]
        opacityOfAnimation.keyTimes = [0, 0.2, 1]
        
        return opacityOfAnimation
    }
    
    func setUpAnimationSet(){
        self.animationSet = CAAnimationGroup()
        self.animationSet.duration = pulsingAnimationDuration + nextPulseAfter
        self.animationSet.repeatCount = numberOfPulses
        
        let defaultCurve = CAMediaTimingFunction (name: CAMediaTimingFunctionName.default)
        self.animationSet.timingFunction = defaultCurve
        self.animationSet.animations = [scalingAnimaiton(), opacityAnimation()]
        
    }

}
