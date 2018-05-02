//
//  StoryNodeViewController.swift
//  ChooseYourOwnAdventure
//  A Swift program inspired by the "Choose Your Own Adventure" children series book which makes use of a Navigation Controller. All pictures used are mine.
//  The user can choose between 2 possible options via 2 UI buttons to progress along the story and a navigation bar button to start over when needed.
//  Created by John Jeffrey Chung on 3/15/17.
//  Copyright © 2017 John Jeffrey Chung. All rights reserved.
//

import UIKit

class StoryNodeViewController: UIViewController {
    override func viewDidLoad() {
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Over", style: UIBarButtonItemStyle.plain, target: self, action: #selector(StoryNodeViewController.startOver))
        self.navigationItem.title = "Epic Adventure Time"
        
        super.viewDidLoad()
    }
    
    @objc func startOver(){
        self.navigationController!.popToRootViewController(animated: true)
    }
}

