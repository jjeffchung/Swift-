//
//  textFieldAnimation.swift
//  buttonsAndAnimations
//  An application which makes use of Swift's Core Animation, with the CALayer Class to create animations on image-based content.
//  Created by John Jeffrey Chung on 7/14/18.
//  Copyright © 2018 John Jeffrey Chung. All rights reserved.
//

import UIKit

class textFieldAnimation: UITextField {

    func shaking () {
        
        let myAnimation = CABasicAnimation(keyPath: "position")
        myAnimation.duration = 0.05
        myAnimation.repeatCount = 5
        myAnimation.autoreverses = true //To create a shaking effect
        myAnimation.fromValue = NSValue (cgPoint: CGPoint (x: self.center.x - 4, y: self.center.y))
        myAnimation.toValue = NSValue (cgPoint: CGPoint (x: self.center.x + 4, y: self.center.y))
        
        self.layer.add(myAnimation, forKey: "position")
    }

}
