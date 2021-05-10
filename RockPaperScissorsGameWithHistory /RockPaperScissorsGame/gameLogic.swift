//  John Chung
//  gameLogic.swift
//  RockPaperScissorsGame
//  A Rock Paper Scissors (RPS) app which lets the user play against computer-generated moves, and includes a Game History of the player's Win and Lose matches.
//  Created by John Jeffrey Chung on 3/22/17.
//  Copyright © 2017 John Jeffrey Chung. All rights reserved.
//

import GameKit

let computerPlay = GKRandomDistribution(lowestValue: 0, highestValue: 2)

let userChoice = selectMove


func selectMove(forOpponent opponent: Bool? = nil, moveInt: Int) -> Move {
    
    var moveInt = moveInt
    
    if opponent != nil {
        
        moveInt = computerPlay.nextInt()
    }
    
    switch moveInt {
    case 0:
        return .rock
    case 1:
        return .paper
    default:
        return .scissors
    }
}

enum Move {
    case rock
    case paper
    case scissors

    
    var moveValue: String {
        
        switch self {
        case .rock:
            return "Rock"
        case .paper:
            return "Paper"
        case .scissors:
            return "Scissors"
        }
    }
    
    func getgameState (move: Move) -> gameState {
        switch self {
        case .rock:
            switch move {
            case .rock:
                return .gameDraw
            case .paper:
                return .gameLose
            case .scissors:
                return .gameWin
            }
            
        case .paper:
            switch move {
            case .rock:
                return .gameLose
            case .paper:
                return .gameWin
            case .scissors:
                return .gameDraw
            }
            
        case . scissors:
            switch move {
            case .rock:
                return .gameLose
            case .paper:
                return .gameWin
            case .scissors:
                return .gameDraw
            }
        }
    }
}
