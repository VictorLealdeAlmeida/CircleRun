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
        
        self.motionManager.startDeviceMotionUpdates()
        self.motionManager.deviceMotionUpdateInterval = 0.1
        self.motionManager.startDeviceMotionUpdates(to: .main){
            (data, error) in
            var moveX : CGFloat = 0.0
            
            if (self.player.position.y+CGFloat((self.motionManager.deviceMotion?.attitude.roll)!*50) >= -530 && self.player.position.y+CGFloat((self.motionManager.deviceMotion?.attitude.roll)!*50) <= 530){
                moveX = CGFloat((self.motionManager.deviceMotion?.attitude.roll)!*75)
            }
            if ((self.player.position.x + moveX) < (self.size.width*0.5) - self.player.size.width/2) && ((self.player.position.x + moveX) > (-self.size.width*0.5) + self.player.size.width/2){
                self.player.run(SKAction.move(to: CGPoint(x: self.player.position.x+moveX, y: self.player.position.y), duration: 0.1))
            }
            
        }
        
    }
}
