//
//  ButtonComponent.swift
//  RunnerGame
//
//  Created by Zack Barovsky on 12/3/20.
//

import Foundation
import SpriteKit
import GameplayKit

class ButtonComponent: SKShapeNode {
    
    
    
    
    // BUTTON EXTENDS DOWN TO CIRCLE AND RECT CLASSES TO MAKE SPECIFIC BUTTON SHAPES WITH SUBCLASSES OF EACH
    
    class Circle {
        init(ButtonComponent: ButtonComponent, rect: CGRect, cornerRadius: CGFloat) {
            
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    
    class Rect {
        init(ButtonComponent: ButtonComponent, circleOfRadius: CGFloat) {
         
            
        }
            
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

