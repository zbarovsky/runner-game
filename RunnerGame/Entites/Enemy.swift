import SpriteKit
import GameplayKit

class Enemy: GKEntity {
    init(image: String) {
        super.init()
        
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: image))
        spriteComponent.node.physicsBody = SKPhysicsBody(texture:SKTexture(imageNamed: image), size: CGSize.init(width: spriteComponent.node.size.width, height: spriteComponent.node.size.height))
        spriteComponent.node.physicsBody?.allowsRotation = false
        spriteComponent.node.physicsBody?.restitution = 0.0
        spriteComponent.node.physicsBody?.friction = 0.0
        
        addComponent(spriteComponent)
        addComponent(EnemyComponent())
        addComponent(EnemyMovementComponent())
        //addComponent(EnemyCountComponent())
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
