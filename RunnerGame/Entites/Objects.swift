import SpriteKit
import GameplayKit

class Object: GKEntity {
    init(image: String) {
        super.init()
        
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: image))
        
        spriteComponent.node.physicsBody = SKPhysicsBody(texture: spriteComponent.node.texture!, size: spriteComponent.node.texture!.size())
        
        if let physicsBody = spriteComponent.node.physicsBody {
            physicsBody.allowsRotation = false
            physicsBody.restitution = 0.0
            physicsBody.friction = 0.0
            
            // need to add collision detection here
        }
        
        
        addComponent(spriteComponent)
        addComponent(ObjectComponent.init())
        // addComponent(ObjectMovementComponent())
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
