//
//  LabelComponent.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 11/18/20.
//

import SpriteKit
import GameplayKit

class LabelComponent: GKComponent {
    
    let node: SKLabelNode

    init(text: String) {
        node = SKLabelNode.init(text: text)
        node.fontName = "HelveticaNeue-Medium"
        node.fontColor = .white
        node.zPosition = 100
        node.numberOfLines = 2
        node.horizontalAlignmentMode = .center
        
        super.init()

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
