//
//  SpriteComponent.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 11/11/20.
//

import SpriteKit
import GameplayKit

class SpriteComponent: GKComponent {

    let node: SKSpriteNode

    init(texture: SKTexture) {
      node = SKSpriteNode(texture: texture, color: .white, size: texture.size())
      super.init()
    }
    
    func addPlayerAnimation() {
        
        if node.action(forKey: "playerWalking") == nil{
            let playerAnimatedAtlas = SKTextureAtlas(named: "manwalking")
            var walkFrames: [SKTexture] = []

            for string in playerAnimatedAtlas.textureNames {
                walkFrames.append(SKTexture.init(imageNamed: string))
            }
            
            let animationAction = SKAction.animate(with: walkFrames, timePerFrame: 0.1)
            let repeatAnimation = SKAction.repeatForever(animationAction)
            
            self.node.run(repeatAnimation, withKey: "playerWalking")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
}
