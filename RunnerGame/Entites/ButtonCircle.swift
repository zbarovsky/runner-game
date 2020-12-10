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
    
    init(radius: CGFloat, text: String) {
        super.init()
        
        let buttonComponentCircle = Circle(radius: radius)
        addComponent(buttonComponentCircle)
        
        let labelComponent = LabelComponent(text: text)
        addComponent(labelComponent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Example of adding a circle W/Text

//var testButton: ButtonCircle!
//testButton = ButtonCircle(radius: 25, text: "A")
//if let buttonNodeCircle = testButton.component(ofType: Circle.self) {
//    buttonNodeCircle.node.position = CGPoint(x: deviceWidth()/2, y: deviceHeight()/4)
//    if let labelNode = testButton.component(ofType: LabelComponent.self) {
//        labelNode.node.position = CGPoint(x: buttonNodeCircle.node.position.x, y: buttonNodeCircle.node.position.y - 20)
//    }
//    print("there should be a circle apparently \(buttonNodeCircle.node.position)")
//}
//entityManager.add(testButton)
