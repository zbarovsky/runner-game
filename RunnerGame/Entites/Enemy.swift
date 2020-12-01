import SpriteKit
import GameplayKit

class Enemy: GKEntity {
    init(image: String) {
        super.init()
        
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: image))
        spriteComponent.node.physicsBody = SKPhysicsBody(texture:SKTexture(imageNamed: image), size: CGSize.init(width: spriteComponent.node.size.width, height: spriteComponent.node.size.height))
        if let physicsBody = spriteComponent.node.physicsBody {
            physicsBody.allowsRotation = false
            physicsBody.restitution = 0.0
            physicsBody.friction = 0.0
            //category sets who the object is
            physicsBody.categoryBitMask = BitMaskCatergories.EnemyCategory.rawValue
            //Contact sets when contactBegin gets called
            physicsBody.contactTestBitMask = BitMaskCatergories.PlayerCategory.rawValue
            //Collision sets what objects interact with physics
            physicsBody.collisionBitMask = BitMaskCatergories.FloorCategory.rawValue //| BitMaskCatergories.EnemyCategory.rawValue
        }
        
        addComponent(spriteComponent)
        addComponent(EnemyComponent())
        addComponent(EnemyMovementComponent())
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
