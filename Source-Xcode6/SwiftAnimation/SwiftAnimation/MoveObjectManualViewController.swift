//
//  MoveObjectManualViewController.swift
//  SwiftAnimation
//
//  Created by Prashant on 16/09/15.
//  Copyright (c) 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class MoveObjectManualViewController: UIViewController {

    
    // start position x,y
    var startX : CGFloat = 0
    var startY : CGFloat = 0
    
    // move object to position x,y
    var moveToX : CGFloat = 0
    var moveToY : CGFloat = 0
    
    // object widh, height
    var objectWidth : CGFloat = 100.0
    var objectHeight : CGFloat = 100.0
    
    // object to animate
    var animationObject : UIImageView!
    
    
    
    // outlet and action - move up
    @IBOutlet var moveUpButton: UIButton!
    @IBAction func moveUpButtonAction(sender: UIButton) {
        self.moveUp()
    }
    
    // outlet and action - move down
    @IBOutlet var moveDownButton: UIButton!
    @IBAction func moveDownButtonAction(sender: UIButton) {
        self.moveDown()
    }
    
    // outlet and action - move left
    @IBOutlet var moveLeftButton: UIButton!
    @IBAction func moveLeftButtonAction(sender: UIButton) {
        self.moveLeft()
    }
    
    // outlet and action - move right
    @IBOutlet var moveRightButton: UIButton!
    @IBAction func moveRightButtonAction(sender: UIButton) {
        self.moveRight()
    }
    
    
    
    // MARK: - View functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        
        // calculate start/end postion based on screen size.
        self.setDimension()
        
        // put animation object on the screen
        self.setUpObject()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // MARK: - Utility functions
    
    // calculate start/end postion based on screen size.
    private func setDimension() -> Void {
        
        // set start postion x,y
        self.startX = self.view.frame.width/2 - self.objectWidth/2
        self.startY = self.view.frame.height/2 - self.objectWidth/2
        
        // set end postion x,y (same as start postion initially)
        self.moveToX = self.startX
        self.moveToY = self.startY
    }
    
    // put animation object on the screen
    private func setUpObject() -> Void {
        
        // create image view as animation object
        self.animationObject = UIImageView()
        
        // set image within animation object
        self.animationObject.image = UIImage(named: "Soccer-Ball")
        
        // set frame for animation object (position x,y and width, height)
        self.animationObject.frame = CGRect(x: self.startX, y: self.startY, width: self.objectWidth, height: self.objectHeight)
        
        // add animation object into view
        self.view.addSubview(self.animationObject)                
    }
    
    // move object up
    private func moveUp() -> Void {
        
        // reduce Y value
        self.moveToY -= 5

        // play animation
        self.playAnimation()
    }

    // move object down
    private func moveDown() -> Void {
        
        // increase Y value
        self.moveToY += 5
        
        // play animation
        self.playAnimation()
    }
    
    // move object left
    private func moveLeft() -> Void {
        
        // reduce X value
        self.moveToX -= 5
        
        // play animation
        self.playAnimation()
    }
    
    // move object right
    private func moveRight() -> Void {

        // increaset X value
        self.moveToX += 5
        
        // play animation
        self.playAnimation()
    }
    
    // play animation
    private func playAnimation()-> Void {
        
        // animation duration
        let animationDuration : NSTimeInterval = 0.2

        // set any delay before start animation
        let animationDelay : NSTimeInterval = 0.0
        
        // set animation options
        let animationOptions : UIViewAnimationOptions = UIViewAnimationOptions.CurveEaseIn
        
        // move oject from current postion to moveToX, moveToY postion
        UIView.animateWithDuration(animationDuration, delay: animationDelay, options: animationOptions,
        animations: { () -> Void in
                
            // set end position for animation object
            self.animationObject.frame  = CGRect(x: self.moveToX, y: self.moveToY, width: self.objectWidth, height: self.objectHeight)
        },
        completion: { (isDone: Bool) -> Void in
            // code here will run after animation completed.
        })
    }
    
    
}
