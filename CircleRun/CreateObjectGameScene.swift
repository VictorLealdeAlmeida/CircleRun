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
        
        if countObj%50 == 0{
            obstacle = squareNewColor()
        }else{
            if value == 0{
                obstacle = squareGood()
            }else{
                obstacle = squareBad()
            }
        }

        obstacle.run(SKAction.rotate(byAngle: randomAngle(), duration: speedObj))
        
        if !dead{
            addChild(obstacle)
            obstacle.run(moveObstacleWithBorn())
        }
        
        countObj += 1
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
        case ObjBad.Pink:
            obstacle.texture = SKTexture(image: ObjBad.Pink)
        default:
            obstacle.texture = SKTexture(image: ObjBad.Red)
        }
        
        obstacle.position = CGPoint(x: size.width * randomBornPosition(), y: size.height * -0.5)
        obstacle.physicsBody = SKPhysicsBody(rectangleOf: obstacle.size)
        obstacle.zPosition = 10
        obstacle.setScale(0.0002*size.width)
        obstacle.color = effectCollisionColor()
        
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
        case ObjGood.Pink:
            obstacle.texture = SKTexture(image: ObjGood.Pink)
        default:
            obstacle.texture = SKTexture(image: ObjGood.Red)
        }
        
        obstacle.position = CGPoint(x: size.width * randomBornPosition(), y: size.height * -0.5)
        obstacle.physicsBody = SKPhysicsBody(rectangleOf: obstacle.size)
        obstacle.zPosition = 10
        obstacle.setScale(0.0002*size.width)
        obstacle.color = effectCollisionColor()
        
        obstacle.physicsBody?.categoryBitMask = PhysicsCategory.ObjGood
        obstacle.physicsBody?.collisionBitMask = PhysicsCategory.None
        obstacle.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        
        return obstacle
    }
    
    func squareNewColor() -> SKSpriteNode{
        
        let obstacle = SKSpriteNode(imageNamed: "RedGood1")
        
        randomNewColor()
        obstacle.texture = SKTexture(image: currentObjNewColor)
        
        obstacle.position = CGPoint(x: size.width * randomBornPosition(), y: size.height * -0.5)
        obstacle.physicsBody = SKPhysicsBody(rectangleOf: obstacle.size)
        obstacle.zPosition = 10
        obstacle.setScale(0.0002*size.width)
        obstacle.color = effectCollisionColor()
        
        obstacle.physicsBody?.categoryBitMask = PhysicsCategory.ObjNewColor
        obstacle.physicsBody?.collisionBitMask = PhysicsCategory.None
        obstacle.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        
        return obstacle
    }
    
    func snow(){
        let starField = SKEmitterNode(fileNamed: "Snow")
        starField?.position = CGPoint(x: 0, y: -self.size.height*0.6)
        starField?.zPosition = -5
        self.addChild(starField!)
    }
}
