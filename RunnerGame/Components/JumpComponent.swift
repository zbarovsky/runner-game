//
//  JumpComponent.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 11/11/20.
//

import SpriteKit
import GameplayKit

class JumpComponent: GKComponent {
    
    var isJumping = false
    var velocity:Double = 0
    var jumpAvailable = true
    
    override init() {
      super.init()
        velocity = 20
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    override func update(deltaTime seconds: TimeInterval) {
      super.update(deltaTime: seconds)
        
        let entity = self.entity!

        if isJumping == true {
            if let spriteComponent = entity.component(ofType: SpriteComponent.self)  {
                if let spritePhsyics = spriteComponent.node.physicsBody {
                    
                    if spriteComponent.node.frame.maxY > deviceHeight() - 100 {
                        isJumping = false
                        jumpAvailable = false
                    } else {
//                        print(spritePhsyics.velocity)
                        if spritePhsyics.velocity.dy < 500 {
                            if spritePhsyics.velocity.dy < 50 {
                                spritePhsyics.velocity = CGVector(dx: 0.0, dy: 75.0)
                            }
                            spriteComponent.node.run(SKAction.applyImpulse(CGVector.init(dx: 0, dy: velocity), duration: 0.01))
                        } else {
                            spritePhsyics.velocity = CGVector(dx: 0.0, dy: 500.0)
                        }
                    }
                }
            }
        }
    }
}
