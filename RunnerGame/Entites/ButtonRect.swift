//
//  ButtonRect.swift
//  RunnerGame
//
//  Created by Zack Barovsky on 12/9/20.
//

import Foundation
import SpriteKit
import GameplayKit

class ButtonRect: GKEntity {
    
    init(rect: CGRect, cornerRadius: CGFloat) {
        super.init()
        
        let buttonComponentRect = Rect(rect: rect, cornerRadius: cornerRadius)
        addComponent(buttonComponentRect)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Example of adding a rectangle

//        var testSquare: ButtonRect!
//        testSquare = ButtonRect(rect: CGRect(x: 0, y: 0, width: 100, height: 150), cornerRadius: 10)
//        if let buttonNodeRect = testSquare.component(ofType: Rect.self) {
//            buttonNodeRect.node.position = CGPoint(x: deviceWidth()/2, y: deviceHeight()/2)
//            print("square printed \(buttonNodeRect.node.position)")
//        }
//        entityManager.add(testSquare)
