//
//  ButtonCircle.swift
//  RunnerGame
//
//  Created by Zack Barovsky on 12/9/20.
//

import Foundation
import SpriteKit
import GameplayKit

class ButtonCircle: GKEntity {
    
    init(radius: CGFloat) {
        super.init()
        
        let buttonComponentCircle = Circle(radius: radius)
        addComponent(buttonComponentCircle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
