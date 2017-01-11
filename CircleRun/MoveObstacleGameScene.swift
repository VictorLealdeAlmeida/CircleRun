//
//  MoveObstacleGameScene.swift
//  CircleRun
//
//  Created by Victor Leal Porto de Almeida Arruda on 11/01/17.
//  Copyright © 2017 VTR. All rights reserved.
//

import SpriteKit
import GameplayKit

extension GameScene{
    func moveObstacleWithBorn() -> SKAction{
        
        let actualDuration = 3.0 //Speed
        let actionMoveOne = SKAction.moveTo(y:-size.height * 0.33, duration: TimeInterval(actualDuration*0.165))
        let actionMoveTwo = SKAction.moveTo(y:size.height/2, duration: TimeInterval(actualDuration*0.835))
        let actionMoveDone = SKAction.removeFromParent()
        let sequence = SKAction.sequence([actionMoveOne, SKAction.run(createObject), actionMoveTwo, actionMoveDone])
        
        return sequence
        
    }
}




