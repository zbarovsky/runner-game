//
//  ButtonComponent.swift
//  RunnerGame
//
//  Created by Zack Barovsky on 12/3/20.
//

import Foundation
import SpriteKit
import GameplayKit

//class ButtonComponent: GKComponent {
    
    class Rect:GKComponent {
        
        let node: SKShapeNode
        
        init(rect: CGRect, cornerRadius: CGFloat) {
            node = SKShapeNode.init(rect: rect, cornerRadius: cornerRadius)
            node.zPosition = 100
            //node.fillColor = .blue
            node.lineWidth = 2
            node.glowWidth = 3
                
            super.init()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    
    class Circle:GKComponent {
        
        let node: SKShapeNode
        
        init(radius: CGFloat) {
            node = SKShapeNode.init(circleOfRadius: radius)
            node.zPosition = 100
            // node.fillColor = .red
            node.lineWidth = 2
            node.glowWidth = 3
            
            super.init()
        }
            
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}

