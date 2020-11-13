//
//  RGStateMachine.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 11/13/20.
//

import SpriteKit
import GameplayKit

class RGStateMachine: GKStateMachine {
        
    override init(states: [GKState]) {
        super.init(states: states)
    }

}

class RGStateMenu: GKState {
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
            return stateClass is RGStatePlaying.Type
        }

        override func didEnter(from previousState: GKState?) {
            print("Did Enter Menu")
        }
    
}

class RGStatePlaying: GKState {
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is RGStatePaused.Type || stateClass is RGStateGameOver.Type
        }

        override func didEnter(from previousState: GKState?) {
            print("Did State Playing")
        }
    
}

class RGStatePaused: GKState {
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
            return stateClass is RGStatePlaying.Type || stateClass is RGStateMenu.Type
        }

        override func didEnter(from previousState: GKState?) {
            print("Did Pause Game")
        }
    
}

class RGStateGameOver: GKState {
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
            return stateClass is RGStatePlaying.Type || stateClass is RGStateMenu.Type
        }

        override func didEnter(from previousState: GKState?) {
            print("Did End Game")
        }
    
}
