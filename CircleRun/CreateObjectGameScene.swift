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
    
    func randomBornPosition() -> CGFloat{
        if signBorn{
            signBorn = false
            return CGFloat(arc4random_uniform(4) + 1)/10
        }else{
            signBorn = true
            return -CGFloat(arc4random_uniform(4) + 1)/10
        }
    }
    
    func randomEndPosition() -> CGFloat{
        if signBorn{
            return -CGFloat(arc4random_uniform(4) + 1)/10
        }else{
            return CGFloat(arc4random_uniform(4) + 1)/10
        }
    }
    
    func randomBornGoodOrBad() -> Int{
        return Int(arc4random_uniform(3) + 1)
    }
    
    func randomAngle() -> CGFloat{
        let value = Int(arc4random_uniform(2))
        if value == 0{
            return CGFloat(arc4random_uniform(30))/10
        }else{
            return -CGFloat(arc4random_uniform(30))/10
        }
    }
    
    func createObject(){
        let value = randomBornGoodOrBad()
        var obstacle : SKSpriteNode
        
        if value == 1{
            obstacle = squareGood()
        }else{
            obstacle = squareBad()
        }

        obstacle.run(SKAction.rotate(byAngle: randomAngle(), duration: speedObj))
        
        addChild(obstacle)
        obstacle.run(moveObstacleWithBorn())
    }
    
    //BAD
    
    func squareBad() -> SKSpriteNode{
        let obstacle = SKSpriteNode(imageNamed: "square")
        
        obstacle.position = CGPoint(x: size.width * randomBornPosition(), y: size.height * -0.5)
        obstacle.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width/2)
        obstacle.zPosition = 10
        obstacle.setScale(0.0002*size.width)
        //  player.physicsBody?.categoryBitMask = PhysicsCategory.Player
        // player.physicsBody?.collisionBitMask = PhysicsCategory.None
        // player.physicsBody?.contactTestBitMask = PhysicsCategory.Monster | PhysicsCategory.TorchObstacle
        
        return obstacle
    }
    
    //GOOD
    
    func squareGood() -> SKSpriteNode{
        let obstacle = SKSpriteNode(imageNamed: "squareGood")
        
        obstacle.position = CGPoint(x: size.width * randomBornPosition(), y: size.height * -0.5)
        obstacle.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width/2)
        obstacle.zPosition = 10
        obstacle.setScale(0.0002*size.width)
        //  player.physicsBody?.categoryBitMask = PhysicsCategory.Player
        // player.physicsBody?.collisionBitMask = PhysicsCategory.None
        // player.physicsBody?.contactTestBitMask = PhysicsCategory.Monster | PhysicsCategory.TorchObstacle
        
        return obstacle
    }
}
