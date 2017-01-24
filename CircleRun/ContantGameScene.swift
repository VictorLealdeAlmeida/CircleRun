//
//  ContantGameScene.swift
//  CircleRun
//
//  Created by Victor Leal Porto de Almeida Arruda on 13/01/17.
//  Copyright © 2017 VTR. All rights reserved.
//

import SpriteKit
import GameplayKit

//Extesion para os contatos
//-------------------------
extension GameScene{
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if (contact.bodyA.area >= contact.bodyB.area) {
            firstBody = contact.bodyA;
            secondBody = contact.bodyB;
        }
        else{
            firstBody = contact.bodyB;
            secondBody = contact.bodyA;
        }
        
        if(contact.bodyB.categoryBitMask == PhysicsCategory.Player && contact.bodyA.categoryBitMask == PhysicsCategory.ObjGood){
            
            //---PegarObjGood---//
            playerDidCollideWithObjGood(firstBody.node as! SKSpriteNode, objO: secondBody.node as! SKSpriteNode)
            
        }else if(contact.bodyB.categoryBitMask == PhysicsCategory.Player && contact.bodyA.categoryBitMask == PhysicsCategory.ObjBad){
            
            //---PegarObjGood---//
            playerDidCollideWithObjBad(firstBody.node as! SKSpriteNode, objO: secondBody.node as! SKSpriteNode)
            
        }else if(contact.bodyB.categoryBitMask == PhysicsCategory.Player && contact.bodyA.categoryBitMask == PhysicsCategory.ObjNewColor){
            
            //---PegarObjNewCor---//
            playerDidCollideWithObjNewColor(firstBody.node as! SKSpriteNode, objO: secondBody.node as! SKSpriteNode)
            playerDidCollideWithObjGood(firstBody.node as! SKSpriteNode, objO: secondBody.node as! SKSpriteNode)

        }
      
    }
    
    func playerDidCollideWithObjGood(_ playerP:SKSpriteNode, objO:SKSpriteNode) {
        objO.removeFromParent()
        if playerStatus == 1{
            player.run(SKAction.scale(to: 0.00016*size.width, duration: 0.25))
            playerStatus = 2
        }else if playerStatus == 2{
            player.run(SKAction.scale(to: 0.0002*size.width, duration: 0.25))
            playerStatus = 3
        }else if playerStatus == 3{
            //OK
        }
    }
    
    func playerDidCollideWithObjBad(_ playerP:SKSpriteNode, objO:SKSpriteNode) {
        
        //Audio
        let bomb = SKAudioNode(fileNamed: "Barrel.wav")
        bomb.autoplayLooped = false
        addChild(bomb)
        bomb.run(SKAction.changeVolume(to: 0.07, duration: 0))
        bomb.run(SKAction.play())
        
        if playerStatus == 1{
            
            effectCollision(node: objO, fileNamed: "Collision")
            effectCollision(node: playerP, fileNamed: "CollisionPlayer")
            playerP.removeFromParent()
            objO.removeFromParent()
            
            gameOver()
            
        }else if playerStatus == 2{
            
            effectCollision(node: playerP, fileNamed: "CollisionPlayer")
            effectCollision(node: objO, fileNamed: "Collision")
            
            objO.removeFromParent()
            player.run(SKAction.scale(to: 0.00012*size.width, duration: 0.25))
            playerStatus = 1
            
        }else if playerStatus == 3{
            
            effectCollision(node: playerP, fileNamed: "CollisionPlayer")
            effectCollision(node: objO, fileNamed: "Collision")
            
            objO.removeFromParent()
            player.run(SKAction.scale(to: 0.00016*size.width, duration: 0.25))
            playerStatus = 2
            
        }
    }
    
    func effectCollision(node : SKSpriteNode, fileNamed : String){
        let starField = SKEmitterNode(fileNamed: fileNamed)
        starField?.position = node.position
        starField?.zPosition = -3
        var color : UIColor
        
        if fileNamed == "Collision"{
            color = node.color
        }else{
            color = UIColor.yellow
        }
        
      
        starField?.particleColorSequence = SKKeyframeSequence(keyframeValues: [color], times: [0])
        
        self.addChild(starField!)
        
        let group = SKAction.group([SKAction.fadeAlpha(to: 0, duration: 1), SKAction.moveTo(y:size.height*0.5, duration: TimeInterval(speedObj*0.5))])
        let sequece = SKAction.sequence([group,SKAction.removeFromParent()])
        starField?.run(sequece)
    }
    
    func effectCollisionColor() -> UIColor{
        
        switch currentObjBad {
        case ObjBad.Red:
            return UIColor(red:0.49, green:0.03, blue:0.03, alpha:1.00)
        case ObjBad.Blue:
            return UIColor(red:0.01, green:0.08, blue:0.49, alpha:1.00)
        case ObjBad.Green:
            return UIColor(red:0.06, green:0.49, blue:0.10, alpha:1.00)
        case ObjBad.Yellow:
            return UIColor(red:0.49, green:0.31, blue:0.06, alpha:1.00)
        case ObjBad.Pink:
            return UIColor(red:0.46, green:0.05, blue:0.49, alpha:1.00)
        default:
            return UIColor(red:0.49, green:0.03, blue:0.03, alpha:1.00)
        }
        
        
    }
    
    func playerDidCollideWithObjNewColor(_ playerP:SKSpriteNode, objO:SKSpriteNode) {
                
        if currentObjNewColor == ObjGood.Red{
            currentObjGood = ObjGood.Red
            currentObjBad = ObjBad.Red
        }else if currentObjNewColor == ObjGood.Blue{
            currentObjGood = ObjGood.Blue
            currentObjBad = ObjBad.Blue
        }else if currentObjNewColor == ObjGood.Green{
            currentObjGood = ObjGood.Green
            currentObjBad = ObjBad.Green
        }else if currentObjNewColor == ObjGood.Yellow{
            currentObjGood = ObjGood.Yellow
            currentObjBad = ObjBad.Yellow
        }else if currentObjNewColor == ObjGood.Pink{
            currentObjGood = ObjGood.Pink
            currentObjBad = ObjBad.Pink
        }
        
    }
    
    func gameOver(){
        
        run(SKAction.playSoundFileNamed("Array.wav", waitForCompletion: true))
        
        dead = true
        removeAction(forKey: "upScore")
        
        recordLabel.removeFromParent()
        scoreLabel.removeFromParent()
        
        scoreLabel.fontName = "Arial"
        scoreLabel.text = String(Int(scoreLabel.text!)!)
        scoreLabel.position = CGPoint(x: 0, y: 0)
        scoreLabel.fontSize = 160
        scoreLabel.alpha = 0
        self.addChild(scoreLabel)
        
        let points = SKLabelNode(fontNamed: "Helvetica")
        
        points.text = "points"
        points.position = CGPoint(x: 0.0*size.width, y: -0.1*size.width)
        points.fontSize = 50
        points.zPosition = 100
        points.alpha = 0

        self.addChild(points)
        
        scoreLabel.run(SKAction.fadeAlpha(to: 1, duration: 1))
        points.run(SKAction.fadeAlpha(to: 1, duration: 1))
        
        if Int(scoreLabel.text!)! > defaults.integer(forKey: "record"){
            defaults.set(Int(scoreLabel.text!)!, forKey: "record")
            
            let record = SKLabelNode(fontNamed: "Helvetica")
            
            record.text = "new record"
            record.position = CGPoint(x: 0*size.width, y: -0.25*size.width)
            record.fontSize = 50
            record.zPosition = 100
            
            self.addChild(record)

            record.run(SKAction.repeatForever(SKAction.sequence([SKAction.fadeAlpha(to: 0, duration: 0.7),SKAction.sequence([SKAction.fadeAlpha(to: 0.7, duration: 1)])])))
        }
        
        tap = UITapGestureRecognizer(target: self, action: #selector(clear))
        view?.addGestureRecognizer(tap!)
    }
    
    func clear(){
        if dead{
            gameSceneDelegate?.newScene()
        }
    }

   
    
}
