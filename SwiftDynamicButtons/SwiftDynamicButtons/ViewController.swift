//
//  ViewController.swift
//  SwiftDynamicButtons
//
//  Created by Arled Kola on 09/11/2014.
//  Copyright (c) 2014 Arled. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var screenSize: CGRect = CGRect()
    var newXPos: CGFloat = CGFloat()
    var newTag: Int = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get screen bounds
        screenSize = UIScreen.mainScreen().bounds
        
        // Register screen width for new buttons.
        newXPos = screenSize.width
        
        //Generate an intial button.
        generateButton(screenSize.height, yPos: screenSize.width, btnTag: 0)
        
    }
    
    func generateButton(xPos: CGFloat, yPos: CGFloat, btnTag: Int) {
        
        // Declare custom button.
        var myButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        
        // Position button.
        myButton.frame = CGRectMake(
            xPos / 5,
            yPos * 0.20,
            90,
            90)
        
        // Set background color.
        myButton.backgroundColor = UIColor.whiteColor()
        
        // Set corner radius so that the button looks round
        myButton.layer.cornerRadius = 45.0
        
        // Set shadow.
        myButton.layer.shadowColor = UIColor.blackColor().CGColor
        myButton.layer.shadowOffset = CGSizeMake(2, 2)
        myButton.layer.shadowRadius = 2
        myButton.layer.shadowOpacity = 0.5
        
        // Give the button a unique tag.
        myButton.tag = btnTag
        
        // Set button title.
        myButton.setTitle("Button \(btnTag)", forState: UIControlState.Normal)
        
        // Set button action.
        myButton.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        // Set button opacity.
        myButton.layer.opacity = 0.8
        
        // Render button
        self.view.addSubview(myButton)
        
    }
    
    
    func buttonPressed(sender:UIButton!) {
        
        // Generate a new x position for the new button.
        newXPos = newXPos + 480.0
        // increment button tag.
        newTag = ++newTag
        
        generateButton(screenSize.height, yPos: newXPos, btnTag: newTag)
        
        println("Clicked button with tag: \(sender.tag)")
        
        // if (sender.tag == 3) {
        // TO DO code...
        // }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

