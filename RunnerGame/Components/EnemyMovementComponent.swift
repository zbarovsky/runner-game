//
//  EnemyMovementComponent.swift
//  RunnerGame
//
//  Created by Zack Barovsky on 11/11/20.
//  Component for Enemy movement towards player

import Foundation
import SpriteKit
import GameplayKit

class EnemyMovementComponent: GKComponent {
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // movement from left x to right x
    func movement(withHaste rateOfSpeed:Double, forEntity entity :GKEntity) {
        
        guard let spriteComponent = entity.component(ofType: SpriteComponent.self) else {
            return
        }
        if spriteComponent.node.physicsBody?.velocity.dx == 0 {
            spriteComponent.node.run(SKAction.moveTo(x: 0, duration: rateOfSpeed))
        }
    }
}
