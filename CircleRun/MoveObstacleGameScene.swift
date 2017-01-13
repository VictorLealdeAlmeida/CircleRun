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
        
        let actualDuration = speedObj 
        let actionMoveOneY = SKAction.moveTo(y:-size.height * 0.33, duration: TimeInterval(actualDuration*0.165))
        let actionMoveTwoY = SKAction.moveTo(y:size.height/2, duration: TimeInterval(actualDuration*0.835))
        let actionMoveX = SKAction.moveTo(x:size.width * randomEndPosition(), duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        let sequence = SKAction.sequence([actionMoveOneY, SKAction.run(createObject), actionMoveTwoY, actionMoveDone])
        let join = SKAction.group([actionMoveX, sequence])
        
        return join
        
    }
}




