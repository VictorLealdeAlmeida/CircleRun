//
//  GameScene.swift
//  CircleRun
//
//  Created by Victor Leal Porto de Almeida Arruda on 03/01/17.
//  Copyright © 2017 VTR. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

struct PhysicsCategory {
    static let None           : UInt32 = 0
    static let Monster        : UInt32 = 0b0
    static let Bat            : UInt32 = 0b1
    static let Player         : UInt32 = 0b10
    static let Sensor         : UInt32 = 0b11
    static let Torch          : UInt32 = 0b100
    static let TorchObstacle  : UInt32 = 0b110
    static let Coin           : UInt32 = 0b111
}

class GameScene: SKScene, SKPhysicsContactDelegate{
    
    var player = SKSpriteNode(imageNamed: "circle")
    var motionManager = CMMotionManager()
    var destX:CGFloat  = 0.0
    
    override func didMove(to view: SKView) {
        //Gravidade do jogo, no caso 0
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
        
        createPlayer()
        motionPlayer()
        
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if destX < 300 && destX > -300{
            let action = SKAction.moveTo(x: destX, duration: 0.1)
            self.player.run(action)
        }
        
            print("----")
    }
    
    
}
