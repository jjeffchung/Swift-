//
//  roundButton.swift
//  buttonsAndAnimations
//  An application which makes use of Swift's Core Animation, with the CALayer Class to create animations on image-based content.
//  Created by John Jeffrey Chung on 7/14/18.
//  Copyright © 2018 John Jeffrey Chung. All rights reserved.
//

import UIKit

@IBDesignable

class RoundButton: UIButton {
    
    @IBInspectable var roundButton: Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }
}
