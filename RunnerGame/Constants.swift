//
//  Constants.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 11/11/20.
//

import Foundation

let scoreInterval = TimeInterval(0.75)
let scoreIncreasePerInterval = 1

let enemyCounterIncrease = 1

let jumpVelocity = 50

var enemySpeed = Double.random(in: 1...3)
var enemiesSpawned = Int.random(in: 0...5)

enum BitMaskCatergories : UInt32 {
    case PlayerCategory = 1 // 0001
    case EnemyCategory = 2  // 0010
    case FloorCategory = 4  // 0100
    case ObjectCategory = 8 // 1000
}

extension Notification.Name {
    static let didEnterStatePlaying = Notification.Name("didEnterStatePlaying")
    static let didEnterStateGameOver = Notification.Name("didEnterStateGameOver")
    static let didEnterStateMenu = Notification.Name("didEnterStateMenu")
    static let didEnterStatePaused = Notification.Name("didEnterStatePaused")
}
