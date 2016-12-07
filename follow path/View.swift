//
//  View.swift
//  follow path
//
//  Created by Admin on 11/27/16.
//  Copyright © 2016 Techkids. All rights reserved.
//

import SpriteKit

typealias HandleContactType = (View) -> ()

class View: SKSpriteNode {
    var hanleContact: HandleContactType?
}
