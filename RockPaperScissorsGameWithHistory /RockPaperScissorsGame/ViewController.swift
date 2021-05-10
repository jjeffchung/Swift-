//  John Chung
//  ViewController.swift
//  RockPaperScissorsGame
//  A Rock Paper Scissors (RPS) app which lets the user play against computer-generated moves, and includes a Game History of the player's Win and Lose matches.
//  Created by John Jeffrey Chung on 3/22/17.
//  Copyright © 2017 John Jeffrey Chung. All rights reserved.
//

import UIKit

var matchHistories = [String]()       //Public array to store match History

class ViewController: UIViewController {
    
    
    var buttons = [UIButton]()
    
    @IBOutlet weak var gameLabel: UILabel!
    
    @IBOutlet weak var gameHeader: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    
    @IBOutlet weak var paperButton: UIButton!
    
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBOutlet weak var playGameButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons = [rockButton, paperButton, scissorsButton]
        updateGame(gameState: .gameStart)
        
        //History Button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Game History", style: .plain, target: self, action: #selector(GameHistory))
        
    }
    
    @IBAction func tapMove(_sender: UIButton) {
        playGame(moveInt: _sender.tag)
        for button in buttons {
            if button != buttons[_sender.tag] {
                button.isHidden = true
            } else {
                button.isEnabled = false
            }
        }
    }
    @IBAction func tapPlay(_sender: UIButton) { //Function to let player play again
        updateGame(gameState: . gameStart)
        for button in buttons {
            button.isHidden = false
            button.isEnabled = true
        }
    }
    
    func playGame(moveInt: Int) {
        let opponentMove = selectMove(forOpponent: true, moveInt: 0)
        let myMove = selectMove(moveInt: moveInt)
        let gameState = myMove.getgameState(move: opponentMove)
        updateGame(gameState: gameState)
        
        gameLabel.text = opponentMove.moveValue
        playGameButton.isHidden = false
    }
    
    func updateGame(gameState: gameState) {
        gameHeader.text = gameState.status
        switch gameState {
        case .gameStart:
            view.backgroundColor = UIColor.white
        case .gameWin:
            view.backgroundColor = gameColor.lightGreen
            matchHistories.append(gameState.status)       //add to History
        case .gameLose:
            view.backgroundColor = gameColor.lightRed
            matchHistories.append(gameState.status)       //add to History
        case .gameDraw:
            view.backgroundColor = UIColor.lightGray
            matchHistories.append(gameState.status)       //add to History
        }
        playGameButton.isHidden = true
        
    }

    @objc func GameHistory() {

        let gameHistoryViewContoller = self.storyboard?.instantiateViewController(withIdentifier: "GameHistory")
        self.navigationController?.pushViewController(gameHistoryViewContoller!, animated: true)
    }
}

