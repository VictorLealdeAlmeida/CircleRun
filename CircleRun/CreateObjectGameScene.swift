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
        let obstacle = SKSpriteNode(imageNamed: "square")
        
        obstacle.position = CGPoint(x: size.width * 0.0, y: size.height * -0.5)
        obstacle.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width/2)
        obstacle.zPosition = 10
        obstacle.setScale(0.0002*size.width)
        //  player.physicsBody?.categoryBitMask = PhysicsCategory.Player
        // player.physicsBody?.collisionBitMask = PhysicsCategory.None
        // player.physicsBody?.contactTestBitMask = PhysicsCategory.Monster | PhysicsCategory.TorchObstacle
        
        addChild(obstacle)
        obstacle.run(moveObstacleWithBorn())
        
    }
}
