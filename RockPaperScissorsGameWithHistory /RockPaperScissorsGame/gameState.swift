//  John Chung
//  gameState.swift
//  RockPaperScissorsGame
//  A Rock Paper Scissors (RPS) app which lets the user play against computer-generated moves, and includes a Game History of the player's Win and Lose matches.
//  Created by John Jeffrey Chung on 3/22/17.
//  Copyright © 2017 John Jeffrey Chung. All rights reserved.
//

enum gameState {
    
    case gameStart
    case gameWin
    case gameLose
    case gameDraw
    
    
    var status: String {
        
        switch self {
            
        case .gameStart:
            return "Let's play Rock. Paper. Scissors."
            
        case .gameWin:
            return "You win this game."
            
        case .gameLose:
            return "You lose this game."
            
        case .gameDraw:
            return "This game is a tie."
        }
    }
}
