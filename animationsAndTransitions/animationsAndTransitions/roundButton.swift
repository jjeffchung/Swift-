//
//  roundButton.swift
//  animationsAndTransitions
//
//  Created by John Jeffrey Chung on 7/18/18.
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

