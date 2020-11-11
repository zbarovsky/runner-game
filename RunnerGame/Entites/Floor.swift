//
//  FloorEntity.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 11/11/20.
//

import SpriteKit
import GameplayKit

class Floor: GKEntity {
    
    init(imageName: String) {
        super.init()
        
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName))
        spriteComponent.node.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: imageName), size: CGSize.init(width: spriteComponent.node.size.width, height: spriteComponent.node.size.height))
        spriteComponent.node.physicsBody?.restitution = 0.0
        spriteComponent.node.physicsBody?.isDynamic = false
        
        addComponent(spriteComponent)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
