//
//  RandomGameScene.swift
//  CircleRun
//
//  Created by Victor Leal Porto de Almeida Arruda on 17/01/17.
//  Copyright © 2017 VTR. All rights reserved.
//

import SpriteKit
import GameplayKit

extension GameScene{

    func randomBornPosition() -> CGFloat{
        if signBorn{
            signBorn = false
            return CGFloat(arc4random_uniform(5))/10
        }else{
            signBorn = true
            return -CGFloat(arc4random_uniform(5))/10
        }
    }
    
    func randomEndPosition() -> CGFloat{
        if signBorn{
            return -CGFloat(arc4random_uniform(5))/10
        }else{
            return CGFloat(arc4random_uniform(5))/10
        }
    }
    
    func randomBornGoodOrBad() -> Int{
        return Int(arc4random_uniform(4))
    }
    
    func randomAngle() -> CGFloat{
        let value = Int(arc4random_uniform(2))
        if value == 0{
            return CGFloat(arc4random_uniform(40))/10
        }else{
            return -CGFloat(arc4random_uniform(40))/10
        }
    }
    
    func randomColor(){
        let value = Int(arc4random_uniform(5))
        if value == 0{
            currentObjGood = ObjGood.Red
            currentObjBad = ObjBad.Red
        }else if value == 1{
            currentObjGood = ObjGood.Blue
            currentObjBad = ObjBad.Blue
        }else if value == 2{
            currentObjGood = ObjGood.Green
            currentObjBad = ObjBad.Green
        }else if value == 3{
            currentObjGood = ObjGood.Yellow
            currentObjBad = ObjBad.Yellow
        }else if value == 4{
            currentObjGood = ObjGood.Pink
            currentObjBad = ObjBad.Pink
        }
    }
    
    func randomNewColor(){
        let value = Int(arc4random_uniform(5))
        if value == 0{
            currentObjNewColor = ObjGood.Red
        }else if value == 1{
            currentObjNewColor = ObjGood.Blue
        }else if value == 2{
            currentObjNewColor = ObjGood.Green
        }else if value == 3{
            currentObjNewColor = ObjGood.Yellow
        }else if value == 4{
            currentObjNewColor = ObjGood.Pink
        }
    }

}
