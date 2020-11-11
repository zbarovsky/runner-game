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
    
    lazy var componentSystems: [GKComponentSystem] = {
        let playerSystem = GKComponentSystem(componentClass: PlayerComponent.self)
        return [playerSystem]
    }()
    
    var toRemove = Set<GKEntity>()

    init(scene: SKScene) {
      self.scene = scene
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
      for componentSystem in componentSystems {
        componentSystem.update(deltaTime: deltaTime)
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
    
    func makePlayerJump() {
        guard let playerEntity = player() else {
             return
         }
         
         playerEntity.update(deltaTime: 0)
    }

}
