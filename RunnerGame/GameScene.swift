//
//  GameScene.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 11/7/20.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var entityManager: EntityManager!
    
    var stateMachine: RGStateMachine!
    
    let coin1Label = SKLabelNode(fontNamed: "Courier-Bold")

    
    override func sceneDidLoad() {
        stateMachine = RGStateMachine.init(states: [RGStatePaused.init(), RGStateMenu.init(), RGStatePlaying.init(), RGStateEndGame.init()])

        entityManager = EntityManager(scene: self, stateMachine: stateMachine)
        
        stateMachine.enter(RGStateMenu.self)
        
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -35)
        self.physicsWorld.contactDelegate = self
        
        createGround()
        
//        let floor = Floor(imageName: "floor")
//        if let floorComponent = floor.component(ofType: SpriteComponent.self) {
//            floorComponent.node.position = CGPoint(x: floorComponent.node.size.width/2, y: floorComponent.node.size.height/6)
//        }
//        entityManager.add(floor)
        
        let player = Player(imageName: "character_maleAdventurer_idle")
        if let playerComponent = player.component(ofType: SpriteComponent.self) {
            playerComponent.node.position = CGPoint(x:size.width/6, y: size.height/2)
        }
        entityManager.add(player)
        
        
        coin1Label.fontSize = 50
        coin1Label.fontColor = SKColor.white
        coin1Label.position = CGPoint(x: 50, y: size.height - 50)
        coin1Label.zPosition = 1
        coin1Label.horizontalAlignmentMode = .left
        coin1Label.verticalAlignmentMode = .center
        coin1Label.text = "10"
        self.addChild(coin1Label)
        
        var newGameLabel: Label!
        newGameLabel = Label(text: "Tap to start")
        if let labelNode = newGameLabel.component(ofType: LabelComponent.self) {
            labelNode.node.position = CGPoint(x: deviceWidth()/2, y: deviceHeight()/2)
        }
        entityManager.add(newGameLabel)
    }
    
    func createGround() {

        for i in 0 ... 1 {
            let floor = Floor.init(imageName: "floor")
            if let floorComponent = floor.component(ofType: SpriteComponent.self) {
                floorComponent.node.zPosition = -10
                if let floorTexture = floorComponent.node.texture {
                    let zeroPoint = (floorTexture.size().width - deviceWidth()) / 2
                    floorComponent.node.position = CGPoint(x: (floorTexture.size().width / 2.0 + (floorTexture.size().width * CGFloat(i))) + zeroPoint, y: floorTexture.size().height / 6)
                    
                    self.entityManager.add(floor)
                }
            }
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        if stateMachine.currentState!.isKind(of: RGStatePlaying.self ){
            entityManager.beginPlayerJump()
        }
        stateMachine.enter(RGStatePlaying.self)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
        if stateMachine.currentState!.isKind(of: RGStatePlaying.self ){
            entityManager.endPlayerJump()
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        entityManager.update(currentTime)
        entityManager.banishEnemy()
        entityManager.removeObj()
        
        if let player = entityManager.player(),
          let playerScore = player.component(ofType: PlayerComponent.self) {
          coin1Label.text = "\(playerScore.score)"
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == BitMaskCatergories.FloorCategory.rawValue && contact.bodyB.categoryBitMask == BitMaskCatergories.PlayerCategory.rawValue {
            if stateMachine.currentState!.isKind(of: RGStatePlaying.self ){
                entityManager.jumpComponent()?.jumpAvailable = true
                entityManager.jumpComponent()?.hasTouchedGround = true
            }
        }
        
        if (contact.bodyB.categoryBitMask == BitMaskCatergories.EnemyCategory.rawValue && contact.bodyA.categoryBitMask == BitMaskCatergories.PlayerCategory.rawValue) || (contact.bodyA.categoryBitMask == BitMaskCatergories.EnemyCategory.rawValue && contact.bodyB.categoryBitMask == BitMaskCatergories.PlayerCategory.rawValue) {
            //Enemy Did Contact with Player
//            entityManager.endGame()
            stateMachine.enter(RGStateEndGame.self)
            
        }
    }
}
