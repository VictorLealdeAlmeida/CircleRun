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
        }
      
    }
    
    func playerDidCollideWithObjGood(_ playerP:SKSpriteNode, objO:SKSpriteNode) {
        objO.removeFromParent()
        if playerStatus == 1{
            player.run(SKAction.scale(to: 0.0002*size.width, duration: 0.25))
            playerStatus = 2
        }else if playerStatus == 2{
            player.run(SKAction.scale(to: 0.00025*size.width, duration: 0.25))
            playerStatus = 3
        }else if playerStatus == 3{
            //OK
        }
    }
    
    func playerDidCollideWithObjBad(_ playerP:SKSpriteNode, objO:SKSpriteNode) {
        
        if playerStatus == 1{
            
            effectCollision(node: playerP, fileNamed: "CollisionPlayer")
            playerP.removeFromParent()
            dead = true
            
        }else if playerStatus == 2{
            
            effectCollision(node: playerP, fileNamed: "CollisionPlayer")
            effectCollision(node: objO, fileNamed: "Collision")
            
            objO.removeFromParent()
            player.run(SKAction.scale(to: 0.00015*size.width, duration: 0.25))
            playerStatus = 1
            
        }else if playerStatus == 3{
            
            effectCollision(node: objO, fileNamed: "Collision")
            effectCollision(node: playerP, fileNamed: "CollisionPlayer")
            
            objO.removeFromParent()
            player.run(SKAction.scale(to: 0.0002*size.width, duration: 0.25))
            playerStatus = 2
            
        }
    }
    
    func effectCollision(node : SKSpriteNode, fileNamed : String){
        let starField = SKEmitterNode(fileNamed: fileNamed)
        starField?.position = node.position
        starField?.zPosition = -3
        self.addChild(starField!)
        
        let sequece = SKAction.sequence([SKAction.fadeAlpha(to: 0, duration: 1),SKAction.removeFromParent()])
        starField?.run(sequece)
    }
    
    func effectCollisionPlayer(){
        let starField = SKEmitterNode(fileNamed: "CollisionPlayer")
        starField?.position = CGPoint(x: 0, y: 0)
        starField?.zPosition = -3
        player.addChild(starField!)
        
        let sequece = SKAction.sequence([SKAction.fadeAlpha(to: 0, duration: 1),SKAction.removeFromParent()])
        starField?.run(sequece)
    }

   
    
}
