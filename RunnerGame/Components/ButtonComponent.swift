//
//  ButtonComponent.swift
//  RunnerGame
//
//  Created by Zack Barovsky on 12/3/20.
//

import Foundation
import SpriteKit
import GameplayKit

class ButtonComponent: SKSpriteNode {
    
    init(texture: SKTexture, color: UIColor, size: CGSize) {
        
        
        
        
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

