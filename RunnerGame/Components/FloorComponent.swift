//
//  FloorComponent.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 12/12/20.
//

import SpriteKit
import GameplayKit

class FloorComponent: GKComponent {
    
    
    override init() {
      super.init()

    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
      super.update(deltaTime: seconds)
        
        //Move floor here
        guard let sprite = self.entity?.component(ofType: SpriteComponent.self)?.node else {
                    return
        }
        if sprite.position.x <= -sprite.texture!.size().width + sprite.texture!.size().width/2 {
            let difference:CGFloat = sprite.position.x + sprite.texture!.size().width/2
            let zeroPoint = (sprite.texture!.size().width - deviceWidth()) / 2 
            sprite.position.x = sprite.texture!.size().width + sprite.texture!.size().width/2 - zeroPoint + difference
        } else {
            sprite.position.x -= CGFloat(floorVelocity*seconds)
        }
    }
}
