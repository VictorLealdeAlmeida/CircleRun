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
    var tapToPlay = SKLabelNode(fontNamed: "Helvetica")

    
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
        
        snow()
        createStringTap()
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(startGame))
        view.addGestureRecognizer(tap)
        
        
       
        
        if(defaults.object(forKey: "record") == nil){
            defaults.set(0, forKey: "record")
        }
        
    }
    
    func startGame(){
        tapToPlay.removeFromParent()
        
        createScoreStrings()
        startScore()
        randomColor()
        createPlayer()
        motionPlayer()
        createObject()
    }
    
    func createStringTap(){
        tapToPlay.text = "tap to play"
        tapToPlay.fontSize = 70
        tapToPlay.zPosition = 100
        tapToPlay.position = CGPoint(x: 0, y: 0)
        
        tapToPlay.run(SKAction.repeatForever(SKAction.sequence([SKAction.fadeAlpha(to: 0, duration: 1),SKAction.sequence([SKAction.fadeAlpha(to: 1, duration: 1)])])))
        
        self.addChild(tapToPlay)
    }
    
    func createScoreStrings(){
        scoreLabel.text = "0000"
        scoreLabel.fontSize = 50
        scoreLabel.zPosition = 100
        scoreLabel.position = CGPoint(x: size.width*0.34, y: size.height*0.44)
        
        self.addChild(scoreLabel)
        
        recordLabel.text = formatString(value: defaults.integer(forKey: "record"))
        recordLabel.fontSize = 30
        recordLabel.fontColor = UIColor.green
        recordLabel.zPosition = 100
        recordLabel.position = CGPoint(x: size.width*0.34, y: size.height*0.41)
        
        self.addChild(recordLabel)
    }
    
    func formatString(value : Int) -> String{
        if value < 10{
            return "000" + String(value)
        }else if value < 100{
            return "00" + String(value)
        }else if value < 1000{
            return "0" + String(value)
        }else{
            return String(value)
        }
    }
    
    func startScore(){
        let upScoreTime = SKAction.sequence([SKAction.run(upScore), SKAction.wait(forDuration: 0.25)])
        run(SKAction.repeatForever(upScoreTime), withKey: "upScore")
    }
    
    func upScore(){
        scoreLabel.text = formatString(value: Int(scoreLabel.text!)! + 1)
    }
    
}
