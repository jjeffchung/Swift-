//
//  ViewController.swift
//  buttonsAndAnimations
//  An application which makes use of Swift's Core Animation, with the CALayer Class to create animations on image-based content.
//  Created by John Jeffrey Chung on 7/14/18.
//  Copyright © 2018 John Jeffrey Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var logoPress: UIImageView!
    
    @IBOutlet weak var buttonOne: RoundButton!
    
    @IBOutlet weak var buttonTwo: RoundButton!
    
    @IBOutlet weak var userTextField: textFieldAnimation!
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        var userAnswer: String = ""
        
        switch (sender){
        case buttonOne:
            userAnswer = "😃"
        case buttonTwo:
            userAnswer = "😞"
        default:
            assert(false)
        }
        userTextField.text = "\(userAnswer)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTextField.delegate = self
        
        logoPress.isUserInteractionEnabled = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.addPulseAnimation))
        tapGestureRecognizer.numberOfTapsRequired = 1
        logoPress.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func addPulseAnimation(){
        
        let pulse = pulseAnimation (numberOfPulses:1, radius: 110, position: logoPress.center)
        
        
        pulse.pulsingAnimationDuration = 0.8
        pulse.backgroundColor = UIColor.red.cgColor
        
        self.view.layer.insertSublayer(pulse, below: logoPress.layer)
    
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        userTextField.shaking()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

