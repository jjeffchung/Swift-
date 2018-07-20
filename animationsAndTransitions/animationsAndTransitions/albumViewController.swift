//
//  albumViewController.swift
//  animationsAndTransitions
//
//  Created by John Jeffrey Chung on 7/18/18.
//  Copyright © 2018 John Jeffrey Chung. All rights reserved.
//

import UIKit

class albumViewController: UIViewController {

    @IBOutlet weak var closeButton: RoundButton!
    
    @IBAction func closeButton(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


