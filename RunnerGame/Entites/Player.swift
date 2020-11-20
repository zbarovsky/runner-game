//
//  Player.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 11/11/20.
//

import SpriteKit
import GameplayKit

class Player: GKEntity {
    
    init(imageName: String){
        super.init()
            
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName))
        
        spriteComponent.node.physicsBody = SKPhysicsBody(texture: spriteComponent.node.texture!, size: spriteComponent.node.texture!.size())
        if let physicsBody = spriteComponent.node.physicsBody {
            physicsBody.allowsRotation = false
            physicsBody.restitution = 0.0
            physicsBody.friction = 0.0
            physicsBody.categoryBitMask = BitMaskCatergories.PlayerCategory.rawValue
            physicsBody.contactTestBitMask = BitMaskCatergories.FloorCategory.rawValue
            physicsBody.collisionBitMask = BitMaskCatergories.FloorCategory.rawValue
        }
        
        addComponent(spriteComponent)
        addComponent(PlayerComponent.init())
        addComponent(JumpComponent())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
