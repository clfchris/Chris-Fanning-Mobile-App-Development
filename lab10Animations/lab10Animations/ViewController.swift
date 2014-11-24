//
//  ViewController.swift
//  lab10Animations
//
//  Created by Chris on 11/23/14.
//  Copyright (c) 2014 Chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var delta = CGPointMake(12, 4)
    var ballRadius = CGFloat()
    var timer = NSTimer()
    var translation = CGPointMake(0.0, 0.0)
    var angle: CGFloat=0.0
    
    @IBOutlet weak var imaageView: UIImageView!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBAction func sliderMoved(sender: UISlider) {
        timer.invalidate()
        changeSliderValue()
    }
    
    func moveImage() {
        let duration=Double(slider.value)
        UIView.beginAnimations("tennis ball", context: nil)
            UIView.animateWithDuration(duration, animations: {self.imaageView.transform=CGAffineTransformMakeScale(self.angle, self.angle)
                self.translation.x += self.delta.x
                self.translation.y += self.delta.y
                })
            //self.translation.x += self.delta.x
            //self.translation.y += self.delta.y
                angle += 0.02
                if angle > CGFloat(2*M_PI) {
                angle=0
            }
        
        UIView.commitAnimations()
        //imaageView.center=CGPointMake(imaageView.center.x + delta.x, imaageView.center.y + delta.y)
        if imaageView.center.x + translation.x > self.view.bounds.size.width-ballRadius || imaageView.center.x + translation.x < ballRadius{
            delta.x = -delta.x
        }
        if imaageView.center.y + translation.y > self.view.bounds.size.height - ballRadius || imaageView.center.y + translation.y < ballRadius {
            delta.y = -delta.y
        }
    }
    @IBAction func changeSliderValue() {
        sliderLabel.text=String(format: "%.2f", slider.value)
        timer = NSTimer.scheduledTimerWithTimeInterval(Double(slider.value), target: self, selector: "moveImage", userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        ballRadius=imaageView.frame.size.width/2
        changeSliderValue()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

