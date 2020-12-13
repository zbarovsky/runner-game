//
//  GameVariables.swift
//  RunnerGame
//
//  Created by Zack Barovsky on 12/1/20.
//

import Foundation
import GameplayKit

let scoreInterval = TimeInterval(0.75)
let scoreIncreasePerInterval = 1

let enemyCounterIncrease = 1

let jumpVelocity = 50

let floorVelocity:Double = 0.0020

var enemySpeed = Double.random(in: 1...3)
var enemiesSpawned = Int.random(in: 0...5)


