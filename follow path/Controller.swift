//
//  Controller.swift
//  follow path
//
//  Created by LuanNX on 11/27/16.
//  Copyright © 2016 Techkids. All rights reserved.
//

import SpriteKit
import UIKit
class Controller{
    let view:View
    var parent:SKNode!
    init(view:View){
        self.view=view
    }
    var size:CGSize{
        get {
            return self.view.size
        }
    }
    var witdth:CGFloat{
        get{
            return self.view.size.width
        }
    }
    var height:CGFloat{
        get{
            return self.view.size.height
        }
    }
    var position:CGPoint{
        get{
            return self.view.position
        }
    }
    func config(position: CGPoint, parent:SKNode){
        self.view.position=position
        self.parent=parent
        parent.addChild(self.view)
    }
}
