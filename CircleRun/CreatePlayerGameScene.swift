//
//  CreatePlayerGameScene.swift
//  CircleRun
//
//  Created by Victor Leal Porto de Almeida Arruda on 03/01/17.
//  Copyright © 2017 VTR. All rights reserved.
//
import SpriteKit
import GameplayKit

extension GameScene{
    func createPlayer(){
        
        player.position = CGPoint(x: size.width * 0.0, y: size.height * 0.25)
        player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width/2)
        player.zPosition = 10
        player.setScale(0.0002*size.width)
        player.physicsBody?.categoryBitMask = PhysicsCategory.Player
        player.physicsBody?.collisionBitMask = PhysicsCategory.None
        player.physicsBody?.contactTestBitMask = PhysicsCategory.ObjGood | PhysicsCategory.ObjBad
        
        addChild(player)
    }
    
}
