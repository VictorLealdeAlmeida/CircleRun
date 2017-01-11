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
    //var motionManager = CMMotionManager()
    var destX:CGFloat  = 0.0
    
    var limitRight : CGFloat = 0.0
    var limitLeft : CGFloat = 0.0
    
    var motionManager : CMMotionManager = {
        let motion = CMMotionManager()
        motion.accelerometerUpdateInterval = 0.01
        
        return motion
        
    }()
    
   
    
    override func didMove(to view: SKView) {
        //Gravidade do jogo, no caso 0
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
        
        limitRight = 0.8*(size.width/2)
        limitLeft = -0.8*(size.width/2)
        
        createPlayer()
        motionPlayer()
        
        createObject()
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    

    
}
