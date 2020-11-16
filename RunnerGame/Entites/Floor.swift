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
        
        spriteComponent.node.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: imageName), size: CGSize.init(width: spriteComponent.node.size.width*2, height: spriteComponent.node.size.height))
        if let physicsBody = spriteComponent.node.physicsBody {
            physicsBody.restitution = 0.0
            physicsBody.isDynamic = false
            physicsBody.categoryBitMask = BitMaskCatergories.FloorCategory.rawValue
            physicsBody.contactTestBitMask = BitMaskCatergories.EnemyCategory.rawValue
            physicsBody.collisionBitMask = BitMaskCatergories.PlayerCategory.rawValue
        }
        
        
        addComponent(spriteComponent)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
