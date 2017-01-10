//
//  AccelerometerGameScene.swift
//  CircleRun
//
//  Created by Victor Leal Porto de Almeida Arruda on 06/01/17.
//  Copyright © 2017 VTR. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

extension GameScene{
    func motionPlayer(){
        if motionManager.isAccelerometerAvailable == true {
            
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler:{
                data, error in
                
                let currentX = self.player.position.x

                if (data!.acceleration.x < 0.0) {
                    if (currentX + CGFloat((data?.acceleration.x)! * 100)) > -300{
                        self.destX = currentX + CGFloat((data?.acceleration.x)! * 100)
                    }
                }
                    
                else if data!.acceleration.x > 0 {
                    if (currentX + CGFloat((data?.acceleration.x)! * 100)) < 300{
                        self.destX = currentX + CGFloat((data?.acceleration.x)! * 100)
                    }
                }
                
                  //  print(self.destX)
                
            })
            
        }
    }
}
