//
//  PlayerController.swift
//  follow path
//
//  Created by LuanNX on 11/27/16.
//  Copyright © 2016 Techkids. All rights reserved.
//

import SpriteKit

class PlayerController:Controller{
    init() {
        super.init(view: View(texture: PLAYER_TEXTURE))
        
        view.physicsBody=SKPhysicsBody(texture: PLAYER_TEXTURE, size: PLAYER_TEXTURE.size())
        view.physicsBody?.categoryBitMask=PLAYER_MASK
        view.physicsBody?.contactTestBitMask=ENEMY_MASK
        view.physicsBody?.collisionBitMask=0
        view.hanleContact = {
            otherView in
            otherView.removeFromParent()
            print("BOom")
        }
    }
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
        configConstrains()
        configParticle()
    }
    func configMove(vector:CGVector){
        view.position=view.position.add(vector: vector)
    }
    func configParticle(){
        let particle=SKEmitterNode(fileNamed: "fire")
        particle?.position=CGPoint(x: 0, y: 0)
        particle?.name="rainParticle"
        particle?.targetNode=parent.scene
        particle?.particleTexture=SKTexture(imageNamed: "spark")
        view.addChild(particle!)
    }
    func configConstrains(){
        let xRange=SKRange(lowerLimit: 0, upperLimit: parent.frame.size.width)
        let yRange=SKRange(lowerLimit: 0, upperLimit: parent.frame.size.height)
        self.view.constraints=[SKConstraint.positionX(xRange),SKConstraint.positionY(yRange)]
    }
}
