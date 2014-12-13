//
//  GameViewController.swift
//  newViking
//
//  Created by Chris Fanning on 12/12/14.
//  Copyright (c) 2014 Chris Fanning. All rights reserved.
//
/* The purpose of this application is to tell a very short story with animations and interaction.
The app is to resemble  a story book, so it only supports large ipads (i.e iPad Air) and it does not rotate away from portrait mode.
Portrait mode ensures the greatest amount of action on the screen
Testing was done on iPad Air*/
import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = UIScreen.mainScreen().applicationFrame
        let scale = UIScreen.mainScreen().scale
        println("appFrame: \(frame)")
        println("scale: \(scale)")
        
        let w = frame.width * scale
        let h = frame.height * scale
        let scene = GameScene(size: CGSize(width: w, height: h))
        
        // Configure the view.
        let skView = self.view as SKView
        //skView.showsFPS = true
        //skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
    }
    
    override func shouldAutorotate() -> Bool {
        return false
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
