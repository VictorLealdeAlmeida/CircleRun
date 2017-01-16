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
        if (contact.bodyA.categoryBitMask >= contact.bodyB.categoryBitMask) {
            firstBody = contact.bodyA;
            secondBody = contact.bodyB;
        }
        else{
            firstBody = contact.bodyB;
            secondBody = contact.bodyA;
        }
        print(2223)
        
        if(contact.bodyA.categoryBitMask == PhysicsCategory.Player && contact.bodyB.categoryBitMask == PhysicsCategory.ObjGood){
            
            //---PegarObjGood---//
            playerDidCollideWithCoin(firstBody.node as! SKSpriteNode, playerP: secondBody.node as! SKSpriteNode)
            print(22)
        }
    }
    
    func playerDidCollideWithCoin(_ objO:SKSpriteNode, playerP:SKSpriteNode) {
        objO.removeAllChildren()
    }
    

   
    
}
