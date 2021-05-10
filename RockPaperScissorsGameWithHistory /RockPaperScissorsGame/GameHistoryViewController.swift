//  John Chung
//  gameHistory.swift
//  RockPaperScissorsGame
//  A Rock Paper Scissors (RPS) app which lets the user play against computer-generated moves, and includes a Game History of the player's Win and Lose matches.
//  Created by John Jeffrey Chung on 3/22/17.
//  Copyright © 2017 John Jeffrey Chung. All rights reserved.
//

import UIKit

class GameHistoryViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Game History"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchHistories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryCellTableViewController
        
        let matchHistory = matchHistories[indexPath.row]
        cell.history.text = matchHistory
        print(matchHistory)
        
        return cell
    }
}
