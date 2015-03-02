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
    var blackDrop : UIView!
    
    var feedIV : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // BLACK BACKDROP
        
        self.blackDrop = UIView(frame: view.frame)
        self.blackDrop.backgroundColor = UIColor.blackColor()
        view.addSubview(self.blackDrop)

        
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
    
    // TRANSITION
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        var destinationVC = segue.destinationViewController as feedViewController
//        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
//        destinationVC.transitioningDelegate = self
//        
//    }
//    
//    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
//        isPresenting = true
//        return self
//    }
//    
//    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
//        isPresenting = false
//        return self
//    }
//    
//    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
//        // The value here should be the duration of the animations scheduled in the animationTransition method
//        return 0.4
//    }

//    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
//        println("animating transition")
//        var containerView = transitionContext.containerView()
//        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
//        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
//        
//        
//        if (isPresenting) {
//
//            containerView.insertSubview(toViewController.view, belowSubview: blackDrop)
//            toViewController.view.alpha = 0
//            self.blackDrop.alpha = 1
//            UIView.animateWithDuration(0.4, animations: { () -> Void in
//                
//                toViewController.view.alpha = 1
//                self.blackDrop.alpha = 0
//                
//                }) { (finished: Bool) -> Void in
//                    transitionContext.completeTransition(true)
//            }
//        } else {
//            UIView.animateWithDuration(0.4, animations: { () -> Void in
//                fromViewController.view.alpha = 0
//                }) { (finished: Bool) -> Void in
//                    transitionContext.completeTransition(true)
//                    fromViewController.view.removeFromSuperview()
//            }
//        }
//    }

    
//    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        interactiveTransition = UIPercentDrivenInteractiveTransition()
//        interactiveTransition.completionSpeed = 0.99
//        return interactiveTransition
//    }

    
    // DONE BUTTON EVENT
    
    func doneButtonTapped(sender:UIButton){
        dismissViewControllerAnimated(true, completion: nil)

    }

    
    // GESTURE : PAN
    
    func didPan(sender:UIPanGestureRecognizer){
        
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        

        if sender.state == UIGestureRecognizerState.Began {
            
//            performSegueWithIdentifier("whiteSegue", sender: self)
            
            shownImageOrigin = self.shownImageView.center
            
        }else if sender.state == UIGestureRecognizerState.Changed {
            

            shownImageView.center = CGPoint(x: self.shownImageOrigin.x, y: shownImageOrigin.y + translation.y)

            if shownImageView.center.y > 250 {
                println("down")
                self.blackDrop.alpha = CGFloat(convertValue(Float(shownImageView.center.y), 250.0, 569, 1, 0))
                self.doneButton.alpha = CGFloat(convertValue(Float(shownImageView.center.y), 250.0, 569, 1, 0))
                self.actionsImageView.alpha = CGFloat(convertValue(Float(shownImageView.center.y), 250.0, 569, 1, 0))

//                interactiveTransition.updateInteractiveTransition(CGFloat(convertValue(Float(shownImageView.center.y), 250.0, 569, 0, 1)))

            } else {
                println("up")
                self.blackDrop.alpha = CGFloat(convertValue(Float(shownImageView.center.y), 250.0, 0, 1, 0))
                self.doneButton.alpha = CGFloat(convertValue(Float(shownImageView.center.y), 250.0, 0, 1, 0))
                self.actionsImageView.alpha = CGFloat(convertValue(Float(shownImageView.center.y), 250.0, 0, 1, 0))

//                interactiveTransition.updateInteractiveTransition(CGFloat(convertValue(Float(shownImageView.center.y), 250.0, 0, 0, 1)))
                



            }
            
        }else if sender.state == UIGestureRecognizerState.Ended {
            
            if shownImageView.center.y > 360 || shownImageView.center.y < 120 {
                
                dismissViewControllerAnimated(true, completion: nil)

//                interactiveTransition.finishInteractiveTransition()
                
            } else {
                

                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.shownImageView.center = self.shownImageOrigin
                    self.blackDrop.alpha = 1
                    self.doneButton.alpha = 1
                    self.actionsImageView.alpha = 1
                }, completion: { (Bool) -> Void in
                    
//                    self.interactiveTransition.cancelInteractiveTransition()

                })
            }


        }
        
        
        

        
    }


}
