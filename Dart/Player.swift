//
//  Player.swift
//  Dart
//
//  Created by Tejay Beckedorf on 20.06.19.
//  Copyright © 2019 Tejay Beckedorf. All rights reserved.
//

import Foundation

class Player {
    var name: String
    var remainingPoints: Int
    var playerIndex:Int
    
    init(_ name: String, _ points: Int, _ PlayerIndex: Int!){
        self.name = name
        self.remainingPoints = points
        self.playerIndex = PlayerIndex
    }
    
    func getName() -> String {
        return name
    }
    
    func setRemainingPoints(_ points: Int){
        self.remainingPoints = points
    }
    
    func getRemainingPoints() -> Int {
        return self.remainingPoints
    }
    
    func setPlayerIndex(_ playerIndex: Int){
        self.playerIndex = playerIndex
    }
    
    func getPlayerIndex() -> Int{
        return self.playerIndex
    }
    
    func checkWinCondition() -> Bool{
        return self.remainingPoints == 0 ? true : false
    }
}
