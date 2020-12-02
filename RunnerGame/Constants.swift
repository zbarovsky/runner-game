//
//  Constants.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 11/11/20.
//

import Foundation

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
