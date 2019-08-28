//
//  Throw.swift
//  Dart
//
//  Created by Tejay Beckedorf on 23.06.19.
//  Copyright © 2019 Tejay Beckedorf. All rights reserved.
//

import Foundation

struct Throw{
    let pointsScored: Int;
    let throwNumber: Int;
    let thrownBy: Player
    
    init(_ points: Int, _ tNumber: Int, _ thrownBy: Player){
        self.pointsScored = points
        self.throwNumber = tNumber
        self.thrownBy = thrownBy
    }
    
    
}
