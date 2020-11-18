//
//  EntityManager.swift
//  RunnerGame
//
//  Created by Tyler Flowers on 11/11/20.
//

import Foundation
import SpriteKit
import GameplayKit

class EntityManager {
    
    var entities = Set<GKEntity>()
    let scene: SKScene
    var stateMachine: RGStateMachine
    
    lazy var componentSystems: [GKComponentSystem] = {
        let playerSystem = GKComponentSystem(componentClass: PlayerComponent.self)
        let jumpSystem = GKComponentSystem(componentClass: JumpComponent.self)
        return [playerSystem, jumpSystem]
    }()
    
    var toRemove = Set<GKEntity>()

    init(scene: SKScene, stateMachine: RGStateMachine) {
      self.scene = scene
        self.stateMachine = stateMachine
        
        NotificationCenter.default.addObserver(self, selector: #selector(onDidEnterStatePlaying(_:)), name: .didEnterStatePlaying, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onDidEnterStateMenu(_:)), name: .didEnterStateMenu, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onDidEnterStateEndGame(_:)), name: .didEnterStateGameOver, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onDidEnterStatePaused(_:)), name: .didEnterStatePaused, object: nil)

    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - Notifications
    
    @objc func onDidEnterStatePlaying(_ notification:Notification) {
        // Do something now
        if let player = player() {
            if let component = player.component(ofType: PlayerComponent.self) {
                component.score = 0
                
                for entity in enemies() {
                     remove(entity)
                }
                
                for entity in entities {
                    if let _ = entity.component(ofType: LabelComponent.self) {
                        remove(entity)
                    }
                }
            }
        }
    }
    
    @objc func onDidEnterStateEndGame(_ notification:Notification) {
        // Do something now
        endGame()
    }
    
    @objc func onDidEnterStatePaused(_ notification:Notification) {
        // Do something now
    }
    
    @objc func onDidEnterStateMenu(_ notification:Notification) {
        // Do something now
    }
    
    //MARK: Lifecycle
    
    func add(_ entity: GKEntity) {
      entities.insert(entity)

        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            scene.addChild(spriteNode)
        }
        
        if let labelNode = entity.component(ofType: LabelComponent.self)?.node {
            scene.addChild(labelNode)
        }
        
        for componentSystem in componentSystems {
          componentSystem.addComponent(foundIn: entity)
        }
    }
    
    func remove(_ entity: GKEntity) {
      if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
        spriteNode.removeFromParent()
      }
        
        if let labelNode = entity.component(ofType: LabelComponent.self)?.node {
          labelNode.removeFromParent()
        }

      entities.remove(entity)
      toRemove.insert(entity)
    }

    func update(_ deltaTime: CFTimeInterval) {
        if stateMachine.currentState?.isKind(of: RGStatePlaying.self) == true {
            summonEnemy(currentTime: deltaTime)
            for componentSystem in componentSystems {
              componentSystem.update(deltaTime: deltaTime)
            }
        }
     
      for currentRemove in toRemove {
        for componentSystem in componentSystems {
          componentSystem.removeComponent(foundIn: currentRemove)
        }
      }
      toRemove.removeAll()
    }
    
    //MARK: Functions
    
    func player() -> GKEntity? {
      for entity in entities {
          if let _ = entity.component(ofType: PlayerComponent.self) {
            return entity
          }
      }
      return nil
    }
    
    func enemies() -> [GKEntity] {
        
        var enemyEntities = [GKEntity.init()]
        
        for entity in entities {
            if let _ = entity.component(ofType: EnemyComponent.self) {
                enemyEntities.append(entity)
            }
        }
        return enemyEntities
    }

    func jumpComponent() -> JumpComponent? {
      for entity in entities {
          if let _ = entity.component(ofType: PlayerComponent.self) {
            if let jumpComp = entity.component(ofType: JumpComponent.self)
            {
            return jumpComp
            }
          }
      }
      return nil
    }
    
    func beginPlayerJump() {
        if let jumpComp = jumpComponent() {
            if jumpComp.jumpAvailable == true && jumpComp.hasTouchedGround {
            jumpComp.isJumping = true
//            print("Begin Jump")
            }
        }
    }
    
    func endPlayerJump() {
        if let jumpComp = jumpComponent() {
            jumpComp.isJumping = false
//            print("End Jump")
        }
    }
    
    func endGame() {
        
        var endGameLabel: Label!
        endGameLabel = Label(text: "Game Over")
        if let labelNode = endGameLabel.component(ofType: LabelComponent.self) {
            labelNode.node.position = CGPoint(x: deviceWidth()/2, y: deviceHeight()/2 + labelNode.node.frame.size.height/2 + 5)
        }
        add(endGameLabel)
        
        var endGameLabel2: Label!
        endGameLabel2 = Label(text: "Tap to play again")
        if let labelNode = endGameLabel2.component(ofType: LabelComponent.self) {
            labelNode.node.position = CGPoint(x: deviceWidth()/2, y: deviceHeight()/2 - labelNode.node.frame.size.height/2 - 5)
        }
        add(endGameLabel2)
        
        
        for entity in enemies() {
            if let enemyComponent = entity.component(ofType: SpriteComponent.self) {
                enemyComponent.node.physicsBody = nil
                enemyComponent.node.removeAllActions()
            }
        }
    }
    
    // function to spawn enemies at random
    func summonEnemy(currentTime: TimeInterval) {
        let spawnTime = currentTime.truncatingRemainder(dividingBy: 5)

        if spawnTime <= 0.5 {

//            guard let enemyEntity = enemy() else {
//                return
//            }

            let enemy = Enemy(image: "enemy" )
            if let enemyComponent = enemy.component(ofType: SpriteComponent.self) {
                if let texture = enemyComponent.node.texture {
                    enemyComponent.node.position = CGPoint(x: deviceWidth() + texture.size().width/2, y: deviceHeight()/2)
                }
            }
            add(enemy)
            
            if let movementComponent = enemy.component(ofType: EnemyMovementComponent.self ) {
                movementComponent.movement(withHaste: 20, forEntity: enemy)
            }
            //enemyMovement()
            
            
            
        }
    }
    
/*
    func enemyMovement() {
        guard let enemyEntity = enemy() else {
            return
        }
        
        if let movementComponent = enemyEntity.component(ofType: EnemyMovementComponent.self ) {
            movementComponent.movement(withHaste: 20, forEntity: enemyEntity)
        }
    }
 */
}
