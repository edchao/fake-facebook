//
//  lightboxViewController.swift
//  fake-facebook
//
//  Created by Ed Chao on 2/24/15.
//  Copyright (c) 2015 edchao. All rights reserved.
//

import UIKit

class lightboxViewController: UIViewController , UIGestureRecognizerDelegate {
    
    // PROPS
    var isPresenting: Bool = true
    var interactiveTransition: UIPercentDrivenInteractiveTransition!
    var shownImage : UIImage!
    var shownImageView: UIImageView!
    var doneImage : UIImage!
    var doneButton: UIButton!
    var actionsImage: UIImage!
    var actionsImageView: UIImageView!
    var shownImageOrigin : CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // BUTTON SETUP
        
        doneImage = UIImage(named:"doneButton")
        doneButton = UIButton.buttonWithType(UIButtonType.Custom) as? UIButton
        doneButton.frame = CGRect(x: 250, y: 16, width: 51, height: 27)
        doneButton.setImage(doneImage, forState: .Normal)
        
        doneButton.addTarget(self,
            action: "doneButtonTapped:",
            forControlEvents: .TouchUpInside)
        view.addSubview(doneButton)
        
        
        // ACTIONS IMAGE
        
        actionsImage = UIImage(named:"photo_actions")
        actionsImageView = UIImageView(image:actionsImage)
        actionsImageView.frame = CGRect(x: 0, y: 524, width: 320, height: 44)
        
        view.addSubview(actionsImageView)
        
        
        // SHOWN IMAGE SETUP
        
        shownImageView = UIImageView(image:shownImage)
        shownImageView.frame = CGRect(x: 0, y: 50, width: 320, height: 470)
        shownImageView.userInteractionEnabled = true
        shownImageView.contentMode = .ScaleAspectFill
        shownImageView.clipsToBounds = true
        
        var panGesture = UIPanGestureRecognizer(target: self, action: "didPan:")
        shownImageView.addGestureRecognizer(panGesture)
        panGesture.delegate = self
      
        
        view.addSubview(shownImageView)
       
        



    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // DONE BUTTON EVENT
    
    func doneButtonTapped(sender:UIButton){
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    // GESTURE : PAN
    
    func didPan(sender:UIPanGestureRecognizer){
        
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            //Started to Pan
            shownImageOrigin = self.shownImageView.center
            
        }else if sender.state == UIGestureRecognizerState.Changed {
            //Panning
            shownImageView.center = CGPoint(x: self.shownImageOrigin.x, y: shownImageOrigin.y + translation.y)
            println(shownImageView.center)
            
        }else if sender.state == UIGestureRecognizerState.Ended {
            //Ended
            
            if shownImageView.center.y > 360 || shownImageView.center.y < 120 {
                dismissViewControllerAnimated(true, completion: nil)
            } else {
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.shownImageView.center = self.shownImageOrigin
                }, completion: { (Bool) -> Void in
                    //
                })
            }


        }
        
        
        

        
    }


}
