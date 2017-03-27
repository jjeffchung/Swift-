//  John Chung King Sow
//  ViewController.swift
//  A Swift program to enable the user to increment, decrement and reset a counter with their respective buttons
// Copyright © 2017 John Jeffrey Chung King Sow. All rights reserved.
// Created by John Jeffrey Chung on 2/15/17.


import UIKit

class ViewController: UIViewController {
    
    // This is the model class, See Counter.swift
    var counter: Counter = Counter()
    
    // A reference to the label in the view heirarchy
    // We need this so that we can set its text
    var label: UILabel?
    
    // View Did Load:
    // This is called once, as soon as the view property is
    // ready to be configured. It is called before the app takes
    // over the screen.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make a label object
        let frame = CGRect(x: 125, y: 120, width: 100, height: 50)
        label = UILabel(frame: frame)
        label!.font = UIFont.systemFont(ofSize: 70)
        label!.text = "0"
        self.view.addSubview(label!)
        
        // Make the Increment button
        let incrementButtonFrame = CGRect(x: 115, y: 200, width: 100, height: 50)
        let incrementButton = UIButton(type: .system)
        incrementButton.frame = incrementButtonFrame
        incrementButton.setTitle("Increment", for: .normal)
        self.view.addSubview(incrementButton)
        
        
        incrementButton.addTarget(self, action: #selector(incrementTheCount), for: .touchDown)
        
        
        // Make the Decrement button
        let decrementButtonFrame = CGRect(x: 115, y: 250, width: 320, height: 50)
        let decrementButton = UIButton(type: .system)
        decrementButton.frame = decrementButtonFrame
        decrementButton.setTitle("Decrement", for: .normal)
        self.view.addSubview(decrementButton)
        
        
        decrementButton.addTarget(self, action: #selector(decrementTheCount), for: .touchDown)
        
        
        // Make the Reset button
        let resetButtonFrame = CGRect(x: 100, y: 300, width: 100, height: 90)
        let resetButton = UIButton(type: .system)
        resetButton.frame = resetButtonFrame
        resetButton.setTitle("Reset", for: .normal)
        self.view.addSubview(resetButton)
        
        
        resetButton.addTarget(self, action: #selector(resetTheCount), for: .touchDown)
        
        
        //Make the Clear Button
        let clearButtonFrame = CGRect(x: 210, y: 350, width: 100, height: 90)
        let clearButton = UIButton(type: .system)
        clearButton.frame = clearButtonFrame
        clearButton.setTitle("Clear", for: .normal)
        self.view.addSubview(clearButton)
        
        
        clearButton.addTarget(self, action: #selector(clearTheCount), for: .touchDown)
        
    }
    
        
    // These are the methods that the buttons will call when it is tapped
    
    func incrementTheCount() {
        counter.increment()
        label!.text = "\(counter.count)"
    }
    
    func decrementTheCount() {
        counter.decrement()
        label!.text = "\(counter.count)"
    }
    
    func clearTheCount() {
        counter.clear()
        label!.text = "\(counter.count)"
    }
    
    
    func resetTheCount() {
        counter.reset()
        label!.text = "\(counter.count)"
    }
    
}







