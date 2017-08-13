//
//  ViewController.swift
//  Calculator Design
//
//  Created by John Jeffrey Chung on 8/4/17.
//  Copyright © 2017 John Jeffrey Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var outputOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingCalc = false
    var currentOperation = 0
    
    @IBOutlet weak var output: UILabel!

    @IBAction func numbersKeypad(_ sender: UIButton) { //Numbers for user to press on keypad. Each number has been assigned a tag and then goruped together in a function for ease of organization
        
        if performingCalc == true {
            output.text = String(sender.tag-1)
            outputOnScreen = Double(output.text!)!
            performingCalc = false
            
        } else {
            output.text = output.text! + String(sender.tag-1)
            outputOnScreen = Double(output.text!)!
        }
        
    }
    
    
    @IBAction func CalculateButtons(_ sender: UIButton) { //The Math operation buttons on the keypad
        
        if output.text != "" && sender.tag != 11 && sender.tag != 12{
            
            previousNumber = Double(output.text!)!
            
            if sender.tag == 13 //The Plus sign
            {
                output.text = "+"
                
            }else if  sender.tag == 14 { //The Minus sign
                
                output.text = "-"
                
            } else if sender.tag == 15 { //The Multiplication sign
                
                output.text = "X"
                
            } else if sender.tag == 16 { //The Division sign
                
                output.text = "/"
                
            } else if sender.tag == 17 { //The Decimal sign
                output.text = String (Float(sender.tag-1))
            }
            
            currentOperation = sender.tag
            performingCalc = true
            
            }
        else if sender.tag == 12{
            if currentOperation == 13 {
                output.text = String(previousNumber + outputOnScreen)
            }
            else if currentOperation == 14 {
                output.text = String(previousNumber - outputOnScreen)
            }
            else if currentOperation == 15 {
                output.text = String(previousNumber * outputOnScreen)
            }
            else if currentOperation == 16 {
                output.text = String(previousNumber / outputOnScreen)
            }
            else if currentOperation == 17 {
                output.text = String(previousNumber + 0.1)
            }
        }
        
        else if sender.tag == 11 {
            output.text = ""
            previousNumber = 0
            outputOnScreen = 0
            currentOperation = 0
        }
    }
}

    



