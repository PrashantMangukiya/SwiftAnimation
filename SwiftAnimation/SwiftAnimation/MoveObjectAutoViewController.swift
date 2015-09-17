//
//  MoveObjectAutoViewController.swift
//  SwiftAnimation
//
//  Created by Prashant on 16/09/15.
//  Copyright (c) 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class MoveObjectAutoViewController: UIViewController {

    // start and end x position
    var startX : CGFloat = 0
    var endX : CGFloat = 0
    
    // start and end y position
    var startY : CGFloat = 0
    var endY : CGFloat = 0
    
    // object widh and height
    var objectWidth : CGFloat = 100.0
    var objectHeight : CGFloat = 100.0
    
    // object to animate
    var animationObject : UIImageView!
    
    
    
    // outlet - bottom toolbar
    @IBOutlet var bottomToolbar: UIToolbar!
    
    // outlet and action - play button
    @IBOutlet var playButton: UIBarButtonItem!
    @IBAction func playButtonAction(sender: UIBarButtonItem) {
        
        // play animation
        self.playAnimation()
        
        // disable play button
        self.playButton.enabled = false
        
        // enable stop button
        self.stopButton.enabled = true
    }
    
    // outlet and action - stop button
    @IBOutlet var stopButton: UIBarButtonItem!
    @IBAction func stopButtonAction(sender: UIBarButtonItem) {
        
        // stop animation
        self.stopAnimation()
        
        // enable play button
        self.playButton.enabled = true
        
        // disable stop button
        self.stopButton.enabled = false
    }
    
    
    
    // MARK - View functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // enable play button
        self.playButton.enabled = true
        
        // disable stop button
        self.stopButton.enabled = false
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // calculate start/end postion based on screen size.
        self.setDimension()
        
        // setup animation object on the screen
        self.setUpObject()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - utility function
    
    // calculate start/end postion based on screen size.
    private func setDimension() -> Void {
        
        // set start, end X postion
        self.startX = self.view.frame.width/2 - self.objectWidth/2
        self.endX = self.startX
        
        // set start. end Y postion
        self.startY = self.navigationController!.navigationBar.frame.maxY + 10
        self.endY = self.bottomToolbar.frame.minY - self.objectHeight - 10
    }
    
    // setup animation object on the screen
    private func setUpObject() -> Void {
        
        // create image view
        self.animationObject = UIImageView()
        
        // set image
        self.animationObject.image = UIImage(named: "Soccer-Ball")
        
        // set frame
        self.animationObject.frame = CGRect(x: self.startX, y: self.startY, width: self.objectWidth, height: self.objectHeight)
        
        // add object into view
        self.view.addSubview(self.animationObject)
        
    }
    
    // play animation
    private func playAnimation()-> Void {
        
        // animation duration
        let animationDuration : NSTimeInterval = 1.0

        // set any delay before start animation        
        let animationDelay : NSTimeInterval = 0.0
        
        // set animation options        
        let animationOptions : UIViewAnimationOptions = [UIViewAnimationOptions.CurveEaseInOut, UIViewAnimationOptions.Autoreverse, UIViewAnimationOptions.Repeat]
        
        // animate the object
        UIView.animateWithDuration(animationDuration, delay: animationDelay, options: animationOptions,
        animations: { () -> Void in
                
            // set end position for animation object
            self.animationObject.frame  = CGRect(x: self.endX, y: self.endY, width: self.objectWidth, height: self.objectHeight)
                
        },
        completion: { (isDone: Bool) -> Void in
                
            // at completion of animaton, set object at default position
            self.animationObject.frame = CGRect(x: self.startX, y: self.startY, width: self.objectWidth, height: self.objectHeight)
        })
    }
    
    // stop the currently runing animation
    private func stopAnimation() -> Void {
        
        // remove all animation from object
        self.animationObject.layer.removeAllAnimations()
    }
    
    
}
