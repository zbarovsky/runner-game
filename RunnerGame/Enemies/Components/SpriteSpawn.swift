import SpriteKit
import GameplayKit

class SpriteSpawn: GKComponent {
    
    // node is used to hold a sprite in the component
    let node: SKSpriteNode
    
    init(texture: SkTexture) {
        node = SkSpriteNode(texture: texture, color: .blue, size: texture.size())
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
