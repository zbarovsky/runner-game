import SpriteKit
import GameplayKit

class Enemy: GkEntity {
    init(image: String) {
        super.init()
        
        // added sprite spawn to moving enemy entitiy
        let spriteSpawn = SpriteSpawn(texture: SKTexture(imageName: image))
        addComponent(spriteSpawn)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
