//
//  Label.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 11/18/20.
//

import SpriteKit
import GameplayKit

class Label: GKEntity {
    

    init(text: String) {
        super.init()

        let labelComponent = LabelComponent(text: text)
        addComponent(labelComponent)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
