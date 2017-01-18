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
import SceneKit

struct PhysicsCategory {
    static let None           : UInt32 = 0
    static let Player         : UInt32 = 0b1
    static let ObjGood        : UInt32 = 0b10
    static let ObjBad         : UInt32 = 0b11
    static let Player32       : UInt32 = 0b110
}

struct ObjGood {
    static let Red           : UIImage = #imageLiteral(resourceName: "RedGood1")
    static let Blue          : UIImage = #imageLiteral(resourceName: "BlueGood")
    static let Green         : UIImage = #imageLiteral(resourceName: "GreenGood")
    static let Yellow        : UIImage = #imageLiteral(resourceName: "YellowGood")
}

struct ObjBad {
    static let Red           : UIImage = #imageLiteral(resourceName: "RedBad1")
    static let Blue          : UIImage = #imageLiteral(resourceName: "BlueBad")
    static let Green         : UIImage = #imageLiteral(resourceName: "GreenBad")
    static let Yellow        : UIImage = #imageLiteral(resourceName: "YellowBad")
}

class GameScene: SKScene, SKPhysicsContactDelegate{
    
    //CreatePlayer
    var player = SKSpriteNode(imageNamed: "circle")
    var playerStatus = 2
    
    //CreateObject
    var signBorn = true
    var dead = false
    var currentObjGood = ObjGood.Red
    var currentObjBad = ObjBad.Red

    //MoveObstacle
    var speedObj = 3.0
    
    //Motion
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
        randomColor()
        
        let starField = SKEmitterNode(fileNamed: "Snow")
        starField?.position = CGPoint(x: 0, y: -self.size.height*0.6)
        starField?.zPosition = -5
        self.addChild(starField!)
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    

    
}
