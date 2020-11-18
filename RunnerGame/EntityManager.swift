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
    }
    
    func add(_ entity: GKEntity) {
      entities.insert(entity)

        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
        scene.addChild(spriteNode)
        }
        
        for componentSystem in componentSystems {
          componentSystem.addComponent(foundIn: entity)
        }
    }
    
    func remove(_ entity: GKEntity) {
      if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
        spriteNode.removeFromParent()
      }

      entities.remove(entity)
      toRemove.insert(entity)
    }

    func update(_ deltaTime: CFTimeInterval) {
        if stateMachine.currentState?.isKind(of: RGStatePlaying.self) == true {
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
    
    func player() -> GKEntity? {
      for entity in entities {
          if let _ = entity.component(ofType: PlayerComponent.self) {
            return entity
          }
      }
      return nil
    }
    
    func enemy() -> GKEntity? {
        for entity in entities {
            if let _ = entity.component(ofType: EnemyComponent.self) {
                return entity
            }
        }
        return nil
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
            enemyMovement()
            
        }
    }
    
    
    func enemyMovement() {
        guard let enemyEntity = enemy() else {
            return
        }
        
        if let movementComponent = enemyEntity.component(ofType: EnemyMovementComponent.self ) {
            movementComponent.movement(withHaste: 20, forEntity: enemyEntity)
        }
    }
}
