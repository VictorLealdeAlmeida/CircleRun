//
//  CreateObjectGameScene.swift
//  CircleRun
//
//  Created by Victor Leal Porto de Almeida Arruda on 11/01/17.
//  Copyright © 2017 VTR. All rights reserved.
//

import SpriteKit
import GameplayKit

extension GameScene{
    
    func createObject(){
        let value = randomBornGoodOrBad()
        var obstacle : SKSpriteNode
        
        if value == 1{
            obstacle = squareGood()
        }else{
            obstacle = squareBad()
        }

        obstacle.run(SKAction.rotate(byAngle: randomAngle(), duration: speedObj))
        
        if !dead{
            addChild(obstacle)
            obstacle.run(moveObstacleWithBorn())
        }
    }
    
    //BAD
    
    func squareBad() -> SKSpriteNode{
        let obstacle = SKSpriteNode(imageNamed: "RedBad1")
        
        switch currentObjBad {
        case ObjBad.Red:
            obstacle.texture = SKTexture(image: ObjBad.Red)
        case ObjBad.Blue:
            obstacle.texture = SKTexture(image: ObjBad.Blue)
        case ObjBad.Green:
            obstacle.texture = SKTexture(image: ObjBad.Green)
        case ObjBad.Yellow:
            obstacle.texture = SKTexture(image: ObjBad.Yellow)
        default:
            obstacle.texture = SKTexture(image: ObjBad.Red)
        }
        
        obstacle.position = CGPoint(x: size.width * randomBornPosition(), y: size.height * -0.5)
        obstacle.physicsBody = SKPhysicsBody(rectangleOf: obstacle.size)
        obstacle.zPosition = 10
        obstacle.setScale(0.0002*size.width)
        obstacle.physicsBody?.categoryBitMask = PhysicsCategory.ObjBad
        obstacle.physicsBody?.collisionBitMask = PhysicsCategory.None
        obstacle.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        
        return obstacle
    }
    
    //GOOD
    
    func squareGood() -> SKSpriteNode{
        
        let obstacle = SKSpriteNode(imageNamed: "RedGood1")
        
        switch currentObjGood {
        case ObjGood.Red:
            obstacle.texture = SKTexture(image: ObjGood.Red)
        case ObjGood.Blue:
            obstacle.texture = SKTexture(image: ObjGood.Blue)
        case ObjGood.Green:
            obstacle.texture = SKTexture(image: ObjGood.Green)
        case ObjGood.Yellow:
            obstacle.texture = SKTexture(image: ObjGood.Yellow)
        default:
            obstacle.texture = SKTexture(image: ObjGood.Red)
        }
        
        obstacle.position = CGPoint(x: size.width * randomBornPosition(), y: size.height * -0.5)
        obstacle.physicsBody = SKPhysicsBody(rectangleOf: obstacle.size)
        obstacle.zPosition = 10
        obstacle.setScale(0.0002*size.width)
        obstacle.physicsBody?.categoryBitMask = PhysicsCategory.ObjGood
        obstacle.physicsBody?.collisionBitMask = PhysicsCategory.None
        obstacle.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        
        return obstacle
    }
}
