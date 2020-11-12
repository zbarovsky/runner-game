//
//  Constants.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 11/11/20.
//

import Foundation

let scoreInterval = TimeInterval(0.5)
let scoreIncreasePerInterval = 1

enum BitMaskCatergories : UInt32 {
    case PlayerCategory = 1
    case EnemyCategory = 2
    case FloorCategory = 4
}
