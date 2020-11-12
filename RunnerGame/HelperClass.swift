//
//  HelperClass.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 11/11/20.
//

import UIKit
import Foundation

class HelperClass {
   
}

func deviceWidth() -> CGFloat {
    let screenRect = UIScreen.main.bounds
    let screenWidth = screenRect.size.width
    return screenWidth
}

func deviceHeight() -> CGFloat {
    let screenRect = UIScreen.main.bounds
    let screenHeight = screenRect.size.height
    return screenHeight
}
