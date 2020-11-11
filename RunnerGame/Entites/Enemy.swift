import SpriteKit
import GameplayKit

class Enemy: GKEntity {
    init(image: String) {
        super.init()
        
        // added sprite spawn to moving enemy entitiy
        let spriteSpawn = SpriteComponent(texture: SKTexture(imageNamed: image))
        addComponent(spriteSpawn)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
