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


//var enemySpeed = GKGaussianDistribution(randomSource: randomizer, lowestValue: 0, highestValue: 5)

var enemySpeed: Double {
    get {
        return Double.random(in: 0...5)
    }
}
var enemiesSpawned: Double {
    get {
        return Double.random(in: 0...10)
    }
}


