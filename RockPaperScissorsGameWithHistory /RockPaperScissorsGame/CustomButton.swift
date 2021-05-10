//
//  CustomButton.swift
//  RockPaperScissorsGame
//A Rock Paper Scissors (RPS) app which lets the user play against computer-generated moves, and includes a Game History of the player's Win and Lose matches.
//  Created by John Jeffrey Chung on 6/24/18.
//  Copyright © 2018 John Jeffrey Chung. All rights reserved.
//

import UIKit

@IBDesignable class RoundButton: UIButton {
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init? (coder aDecoder: NSCoder) {
        super.init (coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() { //is called within the Storyboard editor itself for rendering
        sharedInit()
    }
    
    func sharedInit() {
        refreshCorners(value: cornerRadius)
    }
    
    func refreshCorners (value: CGFloat) {
        layer.cornerRadius = value
    }
    
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    
}
