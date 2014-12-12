//
//  GameViewController.swift
//  Story
//
//  Created by Chris on 12/10/14.
//  Copyright (c) 2014 Chris. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = UIScreen.mainScreen().applicationFrame
        let scale = UIScreen.mainScreen().scale
        
        let w = frame.width * scale
        let h = frame.height * scale
        let scene = GameScene(size: CGSize(width: w, height: h))
        
        let skView = self.view as SKView
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
    }

    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
