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
    static let ObjNewColor    : UInt32 = 0b110
}

struct ObjGood {
    static let Red           : UIImage = #imageLiteral(resourceName: "RedGood1")
    static let Blue          : UIImage = #imageLiteral(resourceName: "BlueGood")
    static let Green         : UIImage = #imageLiteral(resourceName: "GreenGood")
    static let Yellow        : UIImage = #imageLiteral(resourceName: "YellowGood")
    static let Pink          : UIImage = #imageLiteral(resourceName: "PinkGood")
}

struct ObjBad {
    static let Red           : UIImage = #imageLiteral(resourceName: "RedBad1")
    static let Blue          : UIImage = #imageLiteral(resourceName: "BlueBad")
    static let Green         : UIImage = #imageLiteral(resourceName: "GreenBad")
    static let Yellow        : UIImage = #imageLiteral(resourceName: "YellowBad")
    static let Pink          : UIImage = #imageLiteral(resourceName: "PinkBad")

}

class GameScene: SKScene, SKPhysicsContactDelegate{
    
    //GameScene
    var scoreLabel = SKLabelNode(fontNamed: "Helvetica")
    var recordLabel = SKLabelNode(fontNamed: "Helvetica")

    
    //CreatePlayer
    var player = SKSpriteNode(imageNamed: "circle")
    var playerStatus = 2
    
    //CreateObject
    var signBorn = true
    var dead = false
    var currentObjGood = ObjGood.Red
    var currentObjBad = ObjBad.Red
    var currentObjNewColor = ObjGood.Red
    var countObj = 1

    //MoveObstacle
    var speedObj = 3.0
    
    //Contact
    
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
        
        randomColor()
        createPlayer()
        motionPlayer()
        createObject()
        
        createStrings()
        
        startScore()
        
        let starField = SKEmitterNode(fileNamed: "Snow")
        starField?.position = CGPoint(x: 0, y: -self.size.height*0.6)
        starField?.zPosition = -5
        self.addChild(starField!)
        
        if(defaults.object(forKey: "record") == nil){
            defaults.set(0, forKey: "record")
        }
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    func createStrings(){
        scoreLabel.text = "0000"
        scoreLabel.fontSize = 50
        scoreLabel.zPosition = 100
        scoreLabel.position = CGPoint(x: size.width*0.34, y: size.height*0.44)
        
        /*let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        // localize to your grouping and decimal separator
        let priceString = currencyFormatter.string(from: 9999.99)
        print(priceString!)*/

        
        self.addChild(scoreLabel)
        
        recordLabel.text = String(defaults.integer(forKey: "record"))
        recordLabel.fontSize = 30
        recordLabel.fontColor = UIColor.green
        recordLabel.zPosition = 100
        recordLabel.position = CGPoint(x: size.width*0.34, y: size.height*0.41)
        
        self.addChild(recordLabel)
        
        
        
        /*let index1 = scoreLabel.text?.index((scoreLabel.text?.startIndex)!, offsetBy: 2)
        
        print("______")
        print(index1!)*/

        
        
    }
    
    func startScore(){
        let upScoreTime = SKAction.sequence([SKAction.run(upScore), SKAction.wait(forDuration: 0.25)])
        run(SKAction.repeatForever(upScoreTime), withKey: "upScore")
    }
    
    func upScore(){
        scoreLabel.text = String(Int(scoreLabel.text!)! + 1)
    }
    
}
