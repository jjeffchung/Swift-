//  John Chung King Sow
//  Counter.swift
//  A Swift program to enable the user to increment, decrement and reset a counter with their respective buttons
//  Copyright © 2017 John Jeffrey Chung King Sow. All rights reserved.
// Created by John Jeffrey Chung on 2/15/17.


import Foundation


class Counter {
    
    // The private property we will use to 
    // hold the value that is being incremented
    private var value: Int = 0
    
    // A read-only count property
    var count: Int {
        get {
            return value
        }
    }
    
    // Add one
    func increment() {
        value += 1
    }
    
    // Subtract one
    func decrement() {
        value -= 1
    }
    
    //Clear the count to 0
    func clear(){
        value = 0
    }
    
    //Reset the count to 0 
    func reset(){
        value = 0
    }
}
