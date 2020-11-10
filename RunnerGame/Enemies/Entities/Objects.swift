import SpriteKit
import GameplayKit

class Object: GKEntity {
    init(image: String) {
        super.init()
        
        // add spawn capability
        let spriteSpawn = SpriteSpawn(texture: SKTexture(imageName: image))
        addComponent(spriteSpawn)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
