//
//  Scene6.swift
//  newViking
//
//  Created by Chris Fanning on 12/12/14.
//  Copyright (c) 2014 Chris Fanning. All rights reserved.
//

import SpriteKit

class Scene6: SKScene {
    
    var button: SKNode! = nil
    var backButton: SKNode! = nil
    var playButton: SKNode! = nil
    var dragonSky: SKNode! = nil
    
    override func didMoveToView(view: SKView) {
        self.scaleMode = SKSceneScaleMode.AspectFit
        self.backgroundColor = UIColor.whiteColor()
        
        //bottom story label
        let myLabel2 = SKLabelNode(fontNamed: "Chalkduster")
        myLabel2.fontColor = UIColor.blackColor()
        myLabel2.text = "He went up to the dragon at his cave...";
        myLabel2.fontSize = 30;
        myLabel2.position = CGPoint(x:CGRectGetMidX(self.frame), y:300);
        println("label 2 is \(myLabel2.position)")
        
        //viking as a button
        button = SKSpriteNode(imageNamed: "viking.jpg")
        button.position = CGPoint(x: CGRectGetMidX(self.frame) + 400, y: CGRectGetMidY(self.frame))
        
        //back button
        backButton = SKSpriteNode(color: SKColor.redColor(), size: CGSize(width: 100, height: 44));
        backButton.position = CGPoint(x: CGRectGetMinX(self.frame) + 50, y: CGRectGetMidY(self.frame));
        
        //play button
        playButton = SKSpriteNode(color: SKColor.blueColor(), size: CGSize(width: 100, height: 44));
        playButton.position = CGPoint(x: CGRectGetMaxX(self.frame) - 50, y: CGRectGetMidY(self.frame));
        
        //dragon
        dragonSky = SKSpriteNode(imageNamed: "dragon.png")
        dragonSky.position = CGPoint(x: CGRectGetMidX(self.frame) - 300, y: CGRectGetMidY(self.frame) + 200)
        
        //create sprites
        self.addChild(dragonSky)
        self.addChild(myLabel2)
        self.addChild(button)
        self.addChild(backButton)
        self.addChild(playButton)
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
            let scene = Scene7(size: CGSize(width: w, height: h))
            let reverseScene = Scene5(size: CGSize(width: w, height: h))
            
            let location = touch.locationInNode(self)
            
            if button.containsPoint(location){
                view?.presentScene(scene)
                println("tapped")
            }
            
            if backButton.containsPoint(location){
                view?.presentScene(reverseScene)
                println("tapped to go back")
            }
            
            if playButton.containsPoint(location){
                let moveRight = SKAction.moveByX(100.0, y: 0.0, duration: 0.1)
                let moveLeft = SKAction.moveByX(-100.0, y: 0.0, duration: 0.1)
                button.runAction(SKAction.sequence([moveRight, moveLeft, moveRight, moveLeft, moveRight, moveLeft, moveRight, moveLeft]))
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}