//
//  GameScene.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 11/7/20.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entityManager: EntityManager!
    
    override func sceneDidLoad() {
        
        entityManager = EntityManager(scene: self)
        
        let floor = Floor(imageName: "floor")
        if let floorComponent = floor.component(ofType: SpriteComponent.self) {
            floorComponent.node.position = CGPoint(x: floorComponent.node.size.width/2, y: floorComponent.node.size.height/6)
        }
        entityManager.add(floor)
        
        let player = Player(imageName: "player")
        if let playerComponent = player.component(ofType: SpriteComponent.self) {
            playerComponent.node.position = CGPoint(x:size.width/4, y: size.height/2)
        }
        entityManager.add(player)

    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        entityManager.update(currentTime)
        
    }
}
