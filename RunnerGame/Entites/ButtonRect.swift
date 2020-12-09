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
