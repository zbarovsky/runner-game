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
//            print("Did Enter State Menu")
            NotificationCenter.default.post(name: .didEnterStateMenu, object: nil)

        }
    
}

class RGStatePlaying: GKState {
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is RGStatePaused.Type || stateClass is RGStateEndGame.Type
        }

        override func didEnter(from previousState: GKState?) {
//            print("Did Enter State Playing")
            NotificationCenter.default.post(name: .didEnterStatePlaying, object: nil)
        }
    
}

class RGStatePaused: GKState {
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
            return stateClass is RGStatePlaying.Type || stateClass is RGStateMenu.Type
        }

        override func didEnter(from previousState: GKState?) {
//            print("Did Enter State Pause")
            NotificationCenter.default.post(name: .didEnterStatePaused, object: nil)
        }
    
}

class RGStateEndGame: GKState {
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
            return stateClass is RGStatePlaying.Type || stateClass is RGStateMenu.Type
        }

        override func didEnter(from previousState: GKState?) {
//            print("Did Enter State EndGame")
            NotificationCenter.default.post(name: .didEnterStateGameOver, object: nil)
        }
    
}
