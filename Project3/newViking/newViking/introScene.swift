//
//  introScene.swift
//  newViking
//
//  Created by Chris Fanning on 12/12/14.
//  Copyright (c) 2014 Chris Fanning. All rights reserved.
//

import SpriteKit


class introScene: SKScene {
    
    var button: SKNode! = nil
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = UIColor.whiteColor()
        scaleMode = SKSceneScaleMode.AspectFit
        //Top label
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.fontColor = UIColor.blackColor()
        myLabel.text = "How to play:";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:1800);
        println("label 1 is \(myLabel.position)")
        
        //bottom story label
        let myLabel2 = SKLabelNode(fontNamed: "Chalkduster")
        myLabel2.fontColor = UIColor.blackColor()
        myLabel2.text = "To advance the story, simply tap on the Viking!";
        myLabel2.fontSize = 30;
        myLabel2.position = CGPoint(x:CGRectGetMidX(self.frame), y:300);
        println("label 2 is \(myLabel2.position)")
        
        button = SKSpriteNode(imageNamed: "viking.jpg")
        button.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
        self.addChild(myLabel2)
        self.addChild(button)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            if button.containsPoint(location){
                
                let frame = UIScreen.mainScreen().applicationFrame
                let scale = UIScreen.mainScreen().scale
                println("appFrame: \(frame)")
                println("scale: \(scale)")
                
                let w = frame.width * scale
                let h = frame.height * scale
                let scene = scene1(size: CGSize(width: w, height: h))
                view?.presentScene(scene)
                println("tapped")
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
}