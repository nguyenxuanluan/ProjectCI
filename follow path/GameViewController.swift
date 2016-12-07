//
//  GameViewController.swift
//  Sesson1
//
//  Created by Admin on 11/5/16.
//  Copyright (c) 2016 Techkids. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let view = self.view as? SKView {
            let scene = GameScene(size: view.frame.size)
            view.presentScene(scene)
        }
    }
    
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
}
