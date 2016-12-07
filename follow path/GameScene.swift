//
//  GameScene.swift
//  follow path
//
//  Created by Admin on 11/26/16.
//  Copyright © 2016 Techkids. All rights reserved.
//

import SpriteKit
import GameplayKit
import SceneKit
class GameScene: SKScene,SKPhysicsContactDelegate {
    let player=PlayerController()
//    override func didMove(to view: SKView) {
//        player.config(position: CGPoint(x:self.frame.size.width/2,y:50), parent: self)
//        addBackground()
//        configPhysics()
//        let enemy = EnemyController(texture: ENEMY_TEXTURE, size: CGSize(width: 40, height: 40))
//        enemy.config(position: midPoint, parent: self)
////        let logo = SKSpriteNode(imageNamed: "enemy_plane_white_3")
////        logo.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
////        self.addChild(logo)
////        
////        let path = CGMutablePath()
////        path.move(to: CGPoint(x: 0, y: 0))
////        path.addLine(to: CGPoint(x: 50, y: 100))
////        
////        let followLine = SKAction.follow(path, asOffset: true, orientToPath: false, duration: 3)
////        let reversedLine = followLine.reversed()
////        
////        let square = UIBezierPath(rect: CGRect.init(x: 0, y: 0, width: 100, height: 100))
////        let followSquare = SKAction.follow(square.cgPath, asOffset: true, orientToPath: false, duration: 5)
////        
////        
////        let circle = UIBezierPath(roundedRect: CGRect.init(x: 0, y: 0, width: 100, height: 100), cornerRadius: 100)
////        
////        let followCircle = SKAction.follow(circle.cgPath, asOffset: true, orientToPath: false, duration: 5)
////        
////        
////        logo.run(SKAction.sequence([followLine, reversedLine, followSquare, followCircle]))
//        
//              }
    override func didMove(to view: SKView) {
        addBackground()
        configPhysics()
        player.config(position: CGPoint(x:self.frame.size.width/2,y:50), parent: self)
        let enemy = EnemyController(texture: ENEMY_TEXTURE, size: CGSize(width: 40, height: 40))
               enemy.config(position: midPoint, parent: self)
        
    }
  
    
    func addBackground(){
        let background = SKSpriteNode(imageNamed: "background")
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.position = CGPoint(x: 0, y: 0)
        background.zPosition = -1
        self.addChild(background)

    }
    func configPhysics(){
        self.physicsWorld.gravity=CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate=self
    }
 
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let location=touch.location(in: self)
            let previousLocation=touch.previousLocation(in: self)
            let vector=CGVector(dx: location.x-previousLocation.x, dy: location.y-previousLocation.y)
            player.configMove(vector: vector)
            print(player.position)
            
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
        guard let viewA=contact.bodyA.node as? View,
        let viewB=contact.bodyB.node as? View else {
            return
        }
        viewA.hanleContact?(viewB)
        viewB.hanleContact?(viewA)
    }
   
    
    }
    
