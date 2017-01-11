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
        self.motionManager.startGyroUpdates(to: OperationQueue.current!) { (gyroData: CMGyroData?, NSError) in
            self.moveRacket()
            if(NSError != nil) {
                print("\(NSError)")
            }
        }
    }
    
    func moveRacket() {
        
        let yForce = self.motionManager.gyroData!.rotationRate.y
        let dxVelocity = self.player.physicsBody?.velocity.dx
        self.player.physicsBody?.velocity.dx = dxVelocity! + 32*CGFloat(yForce)
        
        //"lock" the racket on the game area
        
        if (player.position.x) > self.frame.maxX - ((player.size.width)){
            player.position.x = self.frame.maxX - ((player.size.width))
        }
        if (player.position.x) < self.frame.minX + ((player.size.width)){
            player.position.x = self.frame.minX + ((player.size.width))
        }
        
    }
}
