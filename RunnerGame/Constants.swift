//
//  Constants.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 11/11/20.
//

import Foundation

enum BitMaskCatergories : UInt32 {
    case PlayerCategory = 1
    case EnemyCategory = 2
    case FloorCategory = 4
    case ObjectCategory = 8
}

extension Notification.Name {
    static let didEnterStatePlaying = Notification.Name("didEnterStatePlaying")
    static let didEnterStateGameOver = Notification.Name("didEnterStateGameOver")
    static let didEnterStateMenu = Notification.Name("didEnterStateMenu")
    static let didEnterStatePaused = Notification.Name("didEnterStatePaused")
}
