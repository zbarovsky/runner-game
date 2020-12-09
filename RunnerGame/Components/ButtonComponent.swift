//
//  ButtonComponent.swift
//  RunnerGame
//
//  Created by Zack Barovsky on 12/3/20.
//

import Foundation
import SpriteKit
import GameplayKit

class ButtonComponent: GKComponent {
    
    
    // BUTTON EXTENDS DOWN TO CIRCLE AND RECT CLASSES TO MAKE SPECIFIC BUTTON SHAPES WITH SUBCLASSES OF EACH
    
    class Rect {
        
        let node: SKShapeNode
        
        init(ButtonComponent: ButtonComponent, rect: CGRect, cornerRadius: CGFloat) {
            node = SKShapeNode.init(rect: rect, cornerRadius: cornerRadius)
            node.zPosition = 100
            node.fillColor = .blue
            node.lineWidth = 10
            node.glowWidth = 30
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    
    class Circle {
        
        let node: SKShapeNode
        
        init(ButtonComponent: ButtonComponent, radius: CGFloat) {
            node = SKShapeNode.init(circleOfRadius: radius)
            node.zPosition = 100
            node.fillColor = .red
            node.lineWidth = 10
            node.glowWidth = 30
            
        }
            
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

