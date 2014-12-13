//
//  Scene8.swift
//  newViking
//
//  Created by Chris Fanning on 12/12/14.
//  Copyright (c) 2014 Chris Fanning. All rights reserved.
//

import SpriteKit

class Scene8: SKScene {
    
    var button: SKNode! = nil
    var backButton: SKNode! = nil
    var playButton: SKNode! = nil
    var myLabel: SKLabelNode! = nil
    var myLabel2: SKLabelNode! = nil
    
    override func didMoveToView(view: SKView) {
        self.scaleMode = SKSceneScaleMode.AspectFit
        self.backgroundColor = UIColor.whiteColor()
        
        //Top label
        myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.fontColor = UIColor.blackColor()
        myLabel.text = "FIN";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:1800);
        
        //bottom story label
        myLabel2 = SKLabelNode(fontNamed: "Chalkduster")
        myLabel2.fontColor = UIColor.blackColor()
        myLabel2.text = "Go To Beginning.";
        myLabel2.fontSize = 50;
        myLabel2.position = CGPoint(x:CGRectGetMidX(self.frame), y:300);
        
        //viking as a button
        button = SKSpriteNode(imageNamed: "viking.jpg")
        button.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        //back button
        backButton = SKSpriteNode(color: SKColor.redColor(), size: CGSize(width: 100, height: 44));
        backButton.position = CGPoint(x: CGRectGetMinX(self.frame) + 50, y: CGRectGetMidY(self.frame));
        
        //play button
        playButton = SKSpriteNode(color: SKColor.blueColor(), size: CGSize(width: 100, height: 44));
        playButton.position = CGPoint(x: CGRectGetMaxX(self.frame) - 50, y: CGRectGetMidY(self.frame));
        
        //create sprites
        self.addChild(button)
        self.addChild(backButton)
        self.addChild(playButton)
        self.addChild(myLabel)
        self.addChild(myLabel2)
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
            let scene = Scene8(size: CGSize(width: w, height: h))
            let reverseScene = Scene7(size: CGSize(width: w, height: h))
            let beginning = Scene2(size: CGSize(width: w, height: h))
            
            let location = touch.locationInNode(self)
            
            if button.containsPoint(location){
                view?.presentScene(scene)
                println("tapped")
            }
            
            if backButton.containsPoint(location){
                view?.presentScene(reverseScene)
                println("tapped to go back")
            }
            
            if myLabel2.containsPoint(location){
                view?.presentScene(beginning)
                println("tapped to go to beginning")
            }
            
            if playButton.containsPoint(location){
                let moveUp = SKAction.moveByX(0.0, y: 50.0, duration: 0.2)
                let moveDown = SKAction.moveByX(0.0, y: -50.0, duration: 0.2)
                let moveRight = SKAction.moveByX(1000.0, y: 0.0, duration: 0.2)
                let pause = SKAction.moveByX(0.0, y: 0.0, duration: 1.0)
                myLabel.runAction(SKAction.sequence([moveUp, moveDown]))
                button.runAction(SKAction.sequence([moveUp, moveDown, pause, moveRight]))
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}