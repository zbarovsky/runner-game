//
//  EnemyCountComponent.swift
//  RunnerGame
//
//  Created by Zack Barovsky on 11/16/20.
//

import Foundation
import SpriteKit
import GameplayKit


class EnemyCountComponent: GKComponent {
    var enemyCount = 0
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implement")
    }
    
    func enemyCounter () {
        //sudo code
        // if enemy appears
        // enemyCount increases by one
    }
}
