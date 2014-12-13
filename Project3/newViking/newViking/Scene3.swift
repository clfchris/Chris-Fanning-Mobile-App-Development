//
//  Scene3.swift
//  newViking
//
//  Created by Chris Fanning on 12/12/14.
//  Copyright (c) 2014 Chris Fanning. All rights reserved.
//

import SpriteKit

class Scene3: SKScene {
    
    var button: SKNode! = nil
    var backButton: SKNode! = nil
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = UIColor.whiteColor()
        self.scaleMode = SKSceneScaleMode.AspectFit
        //bottom story label
        let myLabel2 = SKLabelNode(fontNamed: "Chalkduster")
        myLabel2.fontColor = UIColor.blackColor()
        myLabel2.text = "He lived in a village called Ovinshod.";
        myLabel2.fontSize = 30;
        myLabel2.position = CGPoint(x:CGRectGetMidX(self.frame), y:300);
        println("label 2 is \(myLabel2.position)")
        
        //viking as a button
        button = SKSpriteNode(imageNamed: "viking.jpg")
        button.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        //back button
        backButton = SKSpriteNode(color: SKColor.redColor(), size: CGSize(width: 100, height: 44));
        backButton.position = CGPoint(x: CGRectGetMinX(self.frame) + 50, y: CGRectGetMidY(self.frame));
        
        //hut1
        let hut = SKSpriteNode(imageNamed: "hut.png")
        hut.position = CGPoint(x: CGRectGetMidX(self.frame) - 300 , y: CGRectGetMidY(self.frame));
        
        //hut2
        let hut2 = SKSpriteNode(imageNamed: "hut.png")
        hut2.position = CGPoint(x: CGRectGetMidX(self.frame) + 300, y: CGRectGetMidY(self.frame))
        
        //hut3
        let hut3 = SKSpriteNode(imageNamed: "hut.png")
        hut3.position = CGPoint(x: CGRectGetMidX(self.frame) + 600, y: CGRectGetMidY(self.frame))
        
        //hut4
        let hut4 = SKSpriteNode(imageNamed: "hut.png")
        hut4.position = CGPoint(x: CGRectGetMidX(self.frame) - 600 , y: CGRectGetMidY(self.frame));
        
        //create sprites
        self.addChild(hut)
        self.addChild(hut2)
        self.addChild(hut3)
        self.addChild(hut4)
        self.addChild(myLabel2)
        self.addChild(button)
        self.addChild(backButton)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            
            let frame = UIScreen.mainScreen().applicationFrame
            let scale = UIScreen.mainScreen().scale
            println("appFrame: \(frame)")
            println("scale: \(scale)")
            let w = frame.width * scale
            let h = frame.height * scale
            let scene = Scene4(size: CGSize(width: w, height: h))
            let reverseScene = Scene2(size: CGSize(width: w, height: h))
            
            let location = touch.locationInNode(self)
            
            if button.containsPoint(location){
                view?.presentScene(scene)
                println("tapped")
            }
            
            if backButton.containsPoint(location){
                view?.presentScene(reverseScene)
                println("tapped to go back")
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
