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

enum BitMaskCatergories : UInt32 {
    case PlayerCategory = 1
    case EnemyCategory = 2
    case FloorCategory = 4
}

extension Notification.Name {
    static let didEnterStatePlaying = Notification.Name("didEnterStatePlaying")
    static let didEnterStateGameOver = Notification.Name("didEnterStateGameOver")
    static let didEnterStateMenu = Notification.Name("didEnterStateMenu")
    static let didEnterStatePaused = Notification.Name("didEnterStatePaused")
}
