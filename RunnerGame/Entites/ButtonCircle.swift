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

// MARK: Example of adding a circle

//        var testButton: ButtonCircle!
//        testButton = ButtonCircle(radius: 100)
//        if let buttonNodeCircle = testButton.component(ofType: Circle.self) {
//            buttonNode.node.position = CGPoint(x: deviceWidth()/2, y: deviceHeight()/2)
//            print("there should be a circle apparently \(buttonNode.node.position)")
//        }
//        entityManager.add(testButton)
