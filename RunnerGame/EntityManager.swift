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
                if let playerSprite = player.component(ofType: SpriteComponent.self) {
                    playerSprite.node.isPaused = false
                    playerSprite.addPlayerAnimation()
                }
                
                if let jumpComp = jumpComponent() {
                    jumpComp.isJumping = false
                    jumpComp.jumpAvailable = true
                    jumpComp.hasTouchedGround = true
                    
                }
                
                for entity in enemies() {
                     remove(entity)
                }
                
                for entity in objects() {
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
            spawnObj(currentTime: deltaTime)
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
    
    func objects() -> [GKEntity] {
        
        var objectEntity = [GKEntity.init()]
        
        for entity in entities {
            if let _ = entity.component(ofType: ObjectComponent.self) {
                objectEntity.append(entity)
            }
        }
        return objectEntity
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
                jumpComp.hasTouchedGround = false
//            print("Begin Jump")
                if let playerEntity = player() {
                    if let playerSprite = playerEntity.component(ofType: SpriteComponent.self) {
                        playerSprite.node.removeAction(forKey: "playerWalking")
                        playerSprite.node.texture = SKTexture.init(imageNamed: "character_maleAdventurer_jump")
                    }
                }
            }
        }
    }
    
    func endPlayerJump() {
        if let jumpComp = jumpComponent() {
            jumpComp.isJumping = false
            if jumpComp.hasTouchedGround {
                jumpComp.jumpAvailable = true
            } else {
                jumpComp.jumpAvailable = false
            }
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
        
        for entity in objects() {
            if let enemyComponent = entity.component(ofType: SpriteComponent.self) {
                enemyComponent.node.physicsBody = nil
                enemyComponent.node.removeAllActions()
            }
        }
        
        if let player = player() {
            if let playerComponent = player.component(ofType: SpriteComponent.self) {
                playerComponent.node.isPaused = true
            }
        }
    }
    
    // MARK: Enemy Functions
    
    // function to spawn enemies at random
    func summonEnemy(currentTime: TimeInterval) {
        let spawnTime = currentTime.truncatingRemainder(dividingBy: 2)
        
        let counter = enemies().count
        //print(counter)
        
        if (counter < 2 && spawnTime <= 0.5 ) {
            let enemy = Enemy(image: "enemy" )
                 if let enemyComponent = enemy.component(ofType: SpriteComponent.self) {
                     if let texture = enemyComponent.node.texture {
                        // TODO: IF STATEMENT THAT SAYS IF COLLISION WITH TOP OF ENEMY/OBJECT MOVE BACK ELSE SPAWN
                        // maybe remove collision detection between enemies && self, and enemies && objects??
                         enemyComponent.node.position = CGPoint(x: deviceWidth() + texture.size().width/2, y: deviceHeight()/2)
                     }
                 }
                 add(enemy)
                // movement component for enemies
                 if let movementComponent = enemy.component(ofType: EnemyMovementComponent.self ) {
                     movementComponent.movement(withHaste: enemySpeed, forEntity: enemy)
                    //print(enemySpeed)
             }
        }
    }
    // remove enemies once they get past gamescreen
    func banishEnemy() {
        for entity in enemies() {
            if let enemyComponent = entity.component(ofType: SpriteComponent.self) {
                if enemyComponent.node.position.x <= scene.frame.minX {
                    //print("🎮 out of screen \(enemyComponent.node.position)")
                    remove(entity)
                }
            }
        }
    }
    
    // lets go summon some cars
    func spawnObj(currentTime: TimeInterval) {
        let spawnTime = currentTime.truncatingRemainder(dividingBy: 5)
        
        let counter = objects().count
        
        if (counter < 2 && spawnTime <= 0.5) {
            let object = Object(image: "policecar")
            if let objectComponent = object.component(ofType: SpriteComponent.self) {
                if let texture = objectComponent.node.texture {
                    objectComponent.node.position = CGPoint(x: deviceWidth() + texture.size().width/4, y: deviceHeight()/2)
                }
            }
            add(object)
            
            // movement for police car to move towards player to jump over.
            if let movementComponent = object.component(ofType: EnemyMovementComponent.self){
                movementComponent.movement(withHaste: enemySpeed, forEntity: object)
            }
        }
    }
    
    // remove object from scene
    func removeObj() {
        for object in objects() {
            if let objectComponent = object.component(ofType: SpriteComponent.self) {
                if objectComponent.node.position.x <= scene.frame.minX {
                    //print("car hit edge of screen 💩 butts")
                    remove(object)
                }
            }
        }
    }
    
}
