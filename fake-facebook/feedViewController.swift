//
//  feedViewController.swift
//  fake-facebook
//
//  Created by Ed Chao on 2/24/15.
//  Copyright (c) 2015 edchao. All rights reserved.
//

import UIKit

class feedViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true
    let transitionSpeed : NSTimeInterval! = 0.5

    // PROPS
    
    var navImage : UIImage!
    var navImageView : UIImageView!
    
    var composeImage : UIImage!
    var composeImageView: UIImageView!
    
    var feedImage : UIImage!
    var feedImageView : UIImageView!
    var feedScrollView: UIScrollView!
    
    var weddingImageA : UIImage!
    var weddingImageB : UIImage!
    var weddingImageC : UIImage!
    var weddingImageD : UIImage!
    var weddingImageE : UIImage!

    var weddingImageViewA : UIImageView!
    var weddingImageViewB : UIImageView!
    var weddingImageViewC : UIImageView!
    var weddingImageViewD : UIImageView!
    var weddingImageViewE : UIImageView!
   
    var selectedImageView : UIImageView!
    
    var blackView : UIView!
    var tempView: UIImageView!
    var scrollOffset: CGFloat!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // SETUP SCROLL VIEW
        
        feedImage = UIImage(named: "home_feed")
        feedImageView = UIImageView(image: feedImage)
        feedImageView.userInteractionEnabled = true
        scrollOffset = 0.0
        
        feedScrollView = UIScrollView(frame: CGRect(x: 0, y: 110, width: 320, height: 458))

        feedScrollView.addSubview(self.feedImageView)
        feedScrollView.contentSize = feedImageView.frame.size
        feedScrollView.delegate = self
        
        view.addSubview(self.feedScrollView)
        
        // SETUP IMAGES
        
        weddingImageA = UIImage(named: "wedding1")
        weddingImageB = UIImage(named: "wedding2")
        weddingImageC = UIImage(named: "wedding3")
        weddingImageD = UIImage(named: "wedding4")
        weddingImageE = UIImage(named: "wedding5")
        
        weddingImageViewA = UIImageView(image: weddingImageA)
        weddingImageViewA.userInteractionEnabled = true
        weddingImageViewA.contentMode = .ScaleAspectFill
        weddingImageViewA.clipsToBounds = true
        
        weddingImageViewB = UIImageView(image: weddingImageB)
        weddingImageViewB.userInteractionEnabled = true
        weddingImageViewB.contentMode = .ScaleAspectFill
        weddingImageViewB.clipsToBounds = true
        
        weddingImageViewC = UIImageView(image: weddingImageC)
        weddingImageViewC.userInteractionEnabled = true
        weddingImageViewC.contentMode = .ScaleAspectFill
        weddingImageViewC.clipsToBounds = true
        
        weddingImageViewD = UIImageView(image: weddingImageD)
        weddingImageViewD.userInteractionEnabled = true
        weddingImageViewD.contentMode = .ScaleAspectFill
        weddingImageViewD.clipsToBounds = true
        
        weddingImageViewE = UIImageView(image: weddingImageE)
        weddingImageViewE.userInteractionEnabled = true
        weddingImageViewE.contentMode = .ScaleAspectFill
        weddingImageViewE.clipsToBounds = true
        
        
        // ADD IMAGES TO VIEW
        
        feedScrollView.addSubview(weddingImageViewA)
        weddingImageViewA.frame = CGRect(x: 4, y: 84, width: 154, height: 154)

        feedScrollView.addSubview(weddingImageViewB)
        weddingImageViewB.frame = CGRect(x: 4, y: 242, width: 154, height: 154)
        
        feedScrollView.addSubview(weddingImageViewC)
        weddingImageViewC.frame = CGRect(x: 162, y: 84, width: 150, height: 102)
        
        feedScrollView.addSubview(weddingImageViewD)
        weddingImageViewD.frame = CGRect(x: 162, y: 190, width: 150, height: 102)
        
        feedScrollView.addSubview(weddingImageViewE)
        weddingImageViewE.frame = CGRect(x: 162, y: 296, width: 150, height: 102)
        
        
        // SETUP GESTURES
        
        var tapAGesture = UITapGestureRecognizer(target: self, action: "didTap:")
        tapAGesture.delegate = self
        weddingImageViewA.addGestureRecognizer(tapAGesture)
        
        var tapBGesture = UITapGestureRecognizer(target: self, action: "didTap:")
        tapBGesture.delegate = self
        weddingImageViewB.addGestureRecognizer(tapBGesture)
        
        var tapCGesture = UITapGestureRecognizer(target: self, action: "didTap:")
        tapCGesture.delegate = self
        weddingImageViewC.addGestureRecognizer(tapCGesture)
        
        var tapDGesture = UITapGestureRecognizer(target: self, action: "didTap:")
        tapDGesture.delegate = self
        weddingImageViewD.addGestureRecognizer(tapDGesture)
        
        var tapEGesture = UITapGestureRecognizer(target: self, action: "didTap:")
        tapEGesture.delegate = self
        weddingImageViewE.addGestureRecognizer(tapEGesture)
        
        
        // SETUP NAV VIEW
        
        navImage = UIImage(named: "nav")
        navImageView = UIImageView(image:navImage)
        navImageView.frame = CGRect(x: 0, y: 0, width: 320, height: 64)
        self.view.addSubview(navImageView)
        
        // SETUP ACTIONS VIEW
 
        composeImage = UIImage(named: "compose")
        composeImageView = UIImageView(image:composeImage)
        composeImageView.frame = CGRect(x: 0, y: 64, width: 320, height: 46)
        self.view.addSubview(composeImageView)

    }
    
    // SET SCROLL OFFSET FOR IMAGE POSITIONING
    
    func scrollViewDidScroll(scrollView: UIScrollView){
        
        scrollOffset = CGFloat(feedScrollView.contentOffset.y)
 
    }

    
    
    // GESTURE : TAP
    
    func didTap(sender:UITapGestureRecognizer) {
        
        selectedImageView = sender.view as UIImageView
        performSegueWithIdentifier("lightBoxSegue", sender: self)
        
    }
    

    
    // PREPARE SEGUE : USE CUSTOM PRESENTATION/TRANSITION & SET VALUE
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        var destinationViewController = segue.destinationViewController as lightboxViewController
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = self
        destinationViewController.shownImage = self.selectedImageView.image
        
    }
    
    
    // TRANSITION DELEGATE METHODS
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }

    
    // TRANSITION CONTROL
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return self.transitionSpeed
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // When transitioning, toVC gets injected into the container
        // within the container, the toVC is set to pre-transition state
        // within the container, the toVC is then animated to post-transition state
        // println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        
        if (isPresenting) {
            
            // INJECT BLACK OVERLAY VIEW  // NOTE TO SELF THIS SHOULD GO IN THE OTHER VC
            
            self.blackView = UIView(frame: fromViewController.view.frame)
            self.blackView.backgroundColor = UIColor.blackColor()
            self.blackView.alpha = 0
            containerView.addSubview(self.blackView)
            
            // INJECT TEMP IMAGE VIEW
            
            self.tempView = UIImageView(image:self.selectedImageView.image)
            self.tempView.frame = self.selectedImageView.frame
            self.tempView.center = CGPoint(x: self.selectedImageView.center.x, y: 110 + self.selectedImageView.center.y - self.scrollOffset)
            self.tempView.contentMode = .ScaleAspectFill
            self.tempView.clipsToBounds = true
            self.tempView.userInteractionEnabled = true

            
            containerView.addSubview(self.tempView)
            
            
            // INJECT toVC
            
            containerView.addSubview(toViewController.view)
    
            
            // INITIAL STATE OF toVC
            
            toViewController.view.alpha = 0
            
            // FORWARD ANIMATION
            
            UIView.animateWithDuration(self.transitionSpeed, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 13.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
                
                self.tempView.frame = CGRect(x: 0, y: 50, width: 320, height: 470)
                self.blackView.alpha = 1

                
            }, completion: { (Bool) -> Void in
                
                // ANIMATE IN toVC
                
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    toViewController.view.alpha = 1

                }, completion: { (Bool) -> Void in
                    
                    transitionContext.completeTransition(true)
                })

            })
            
        } else {
            
            
            fromViewController.view.alpha = 0
            
            // CASTING FROMVC
            var lightBoxVC = fromViewController as lightboxViewController
            self.tempView.center = lightBoxVC.shownImageView.center
            
            // REVERSE ANIMATION
            
            UIView.animateWithDuration(self.transitionSpeed, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 13.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
                
                self.blackView.alpha = 0
                self.tempView.frame = self.selectedImageView.frame
                self.tempView.center = CGPoint(x: self.selectedImageView.center.x, y: 110 + self.selectedImageView.center.y - self.scrollOffset)
                
            }, completion: { (Bool) -> Void in
                    self.tempView.removeFromSuperview()
                    self.blackView.removeFromSuperview()
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            })
        }
    }

    
    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

    }

    


}
