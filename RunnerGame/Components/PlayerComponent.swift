//
//  PlayerComponent.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 11/11/20.
//

import Foundation
import SpriteKit
import GameplayKit

class PlayerComponent: GKComponent {
    
    var score = 0
    var lastScoreInterval = TimeInterval(0)
    
    override init() {
      super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    override func update(deltaTime seconds: TimeInterval) {
      super.update(deltaTime: seconds)

        if (CACurrentMediaTime() - lastScoreInterval > scoreInterval) {
          lastScoreInterval = CACurrentMediaTime()
          score += scoreIncreasePerInterval
        }
        print(score)
        
    }
    

}
