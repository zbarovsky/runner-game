//
//  PlayerComponent.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 11/11/20.
//

import Foundation
import SpriteKit
import GameplayKit

class PlayerComponent: GKComponent {
    
    var score = 0
    var lastScoreInterval = TimeInterval(0)
    
    let playerX = deviceWidth() / 6
    
    override init() {
      super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    override func update(deltaTime seconds: TimeInterval) {
      super.update(deltaTime: seconds)
        
        if let sprite = self.entity?.component(ofType: SpriteComponent.self)?.node {
            if sprite.position.x < playerX - 5  {
                let movementAnimation = SKAction.moveTo(x: playerX, duration: 1)
                if let _ = sprite.action(forKey: "reposition") {
//                    sprite.run(movementAnimation, withKey: "reposition")
                } else {
                    sprite.run(movementAnimation, withKey: "reposition")

                }
            }
        }

        if (CACurrentMediaTime() - lastScoreInterval > scoreInterval) {
          lastScoreInterval = CACurrentMediaTime()
          score += scoreIncreasePerInterval
        }
    }
    

}
