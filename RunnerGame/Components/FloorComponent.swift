//
//  FloorComponent.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 12/12/20.
//

import SpriteKit
import GameplayKit

class FloorComponent: GKComponent {
    
    var previousTime:TimeInterval?
    var newGame:Bool = true
    var gameIsRunning = false
    
    
    override init() {
      super.init()
        previousTime = 0
        newGame = true
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
      super.update(deltaTime: seconds)
        
        if newGame {
            self.previousTime = seconds
            newGame = false
        }
        
        //Move floor here
        guard let sprite = self.entity?.component(ofType: SpriteComponent.self)?.node else {
                    return
        }
        if sprite.position.x <= -sprite.texture!.size().width/2 {
            let difference:CGFloat = sprite.position.x + sprite.texture!.size().width/2
            sprite.position.x = sprite.texture!.size().width + sprite.texture!.size().width/2 + difference
        } else {
            if let previousTime = previousTime {
                let deltaChange = seconds - previousTime
                if deltaChange != 0 && gameIsRunning {
                    sprite.position.x -= CGFloat(floorVelocity*deltaChange)
                }
                self.previousTime = seconds
            }
        }
    }
}
