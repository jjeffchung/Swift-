//
//  ViewController.swift
//  ScientificCalculator
//
//  Created by John Jeffrey Chung on 5/14/18.
//  Copyright © 2018 John Jeffrey Chung. All rights reserved.
//

import UIKit

enum Operation: String {
    case Addition = "+"
    case Subtraction = "-"
    case Multiplication = "x"
    case Division = "/"
    //case Percent = "%"
    case InitialLabel = "InitialLabel"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var output: UILabel!
    
    var currentNumber = "" //Number displayed on screen
    var leftOperand = ""
    var rightOperand = ""
    var result = "" //The result of the performed operation
    var currentOperation: Operation = .InitialLabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.text = "0"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func decimalSignPressed(_ sender: RoundButton) {
        if currentNumber.count <= 7 && !currentNumber.contains("."){
            currentNumber += "."
            output.text = currentNumber
        }
    }
    
    @IBAction func squareRootPressed(_ sender: RoundButton) {
        if currentNumber.count > 0 {
            currentNumber = "\(sqrt(Double(currentNumber)!))"
            output.text = currentNumber
        }
    }
    
    
    @IBAction func numPadPressed(_ sender: RoundButton) { //All the digits on the numpad have been tagged and added to this action
        
        if currentNumber.count <= 8 { //As long as there is not 8 digits on screen, the user can keep adding more numbers
            currentNumber += "\(sender.tag)"
            output.text = currentNumber
        }
    }
    
    @IBAction func allClearPressed(_ sender: RoundButton) { //Erasing all numbers on screen and getting to the initial screen
        currentNumber = ""
        leftOperand = ""
        rightOperand = ""
        currentOperation = .InitialLabel //The default screen
        output.text = ""
    }
    
    @IBAction func percentSignPressed(_ sender: RoundButton) {
        if currentNumber.count > 0{
            currentNumber = "\(Double(currentNumber)! / 100)"
            output.text = currentNumber
        }
    }
    
    @IBAction func clearSignPressed(_ sender: RoundButton){
        currentNumber = String(currentNumber.dropLast())
        output.text = currentNumber
    }
    
    @IBAction func equalSignPressed(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    
    @IBAction func addSignPressed(_ sender: RoundButton) {
        operation(operation: .Addition)
    }
    
    @IBAction func subtractSignPressed(_ sender: RoundButton) {
        operation(operation: .Subtraction)
    }
    
    @IBAction func multiplySignPressed(_ sender: RoundButton) {
        operation(operation: .Multiplication)
    }
    
    @IBAction func divideSignPressed(_ sender: RoundButton) {
        operation(operation: .Division)
    }
    
    
    func operation(operation: Operation){
        if currentOperation != .InitialLabel{
            if currentNumber != "" {
                rightOperand = currentNumber
                currentNumber = ""
                
                if currentOperation == .Addition{
                    result = "\(Double(leftOperand)! + Double(rightOperand)!)"
                    
                }else if currentOperation == .Subtraction {
                    result = "\(Double(leftOperand)! - Double(rightOperand)!)"
                    
                }else if currentOperation == .Multiplication {
                    result = "\(Double(leftOperand)! * Double(rightOperand)!)"
                    
                }else if currentOperation == .Division{
                    result = "\(Double(leftOperand)! / Double(rightOperand)!)"
                }
                
                leftOperand = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){ //If remainder is divisible by 1 and is equal to 0, the result will then be displayed as an integer
                    result = "\(Int(Double(result)!))"
                }
                output.text = result
            }
            
            currentOperation = operation
            
        }else {
            leftOperand = currentNumber
            currentNumber = ""
            currentOperation = operation
        }
        
        
    }
    
    
}

