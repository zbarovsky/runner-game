//
//  JumpComponent.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 11/11/20.
//

import SpriteKit
import GameplayKit

class JumpComponent: GKComponent {
    
    override init() {
      super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    override func update(deltaTime seconds: TimeInterval) {
      super.update(deltaTime: seconds)
        
        guard let entity = entity else {
            return
        }
        
       guard let spriteComponent = entity.component(ofType: SpriteComponent.self) else {
          return
       }
        if spriteComponent.node.physicsBody?.velocity.dy == 0{
            spriteComponent.node.run(SKAction.applyImpulse(CGVector.init(dx: 0, dy: 175), duration: 0.1))
        }
    }
}
