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
            playerP.removeFromParent()
        }else if playerStatus == 2{
            objO.removeFromParent()
            player.run(SKAction.scale(to: 0.00015*size.width, duration: 0.25))
            playerStatus = 1
        }else if playerStatus == 3{
            objO.removeFromParent()
            player.run(SKAction.scale(to: 0.0002*size.width, duration: 0.25))
            playerStatus = 2
        }
    }
    

   
    
}
