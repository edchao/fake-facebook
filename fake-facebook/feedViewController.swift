//
//  feedViewController.swift
//  fake-facebook
//
//  Created by Ed Chao on 2/24/15.
//  Copyright (c) 2015 edchao. All rights reserved.
//

import UIKit

class feedViewController: UIViewController, UIGestureRecognizerDelegate {

    // PROPS
    
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SETUP SCROLL VIEW
        
        feedImage = UIImage(named: "home_feed")
        feedImageView = UIImageView(image: feedImage)
        feedImageView.userInteractionEnabled = true
        
        feedScrollView = UIScrollView(frame: UIScreen.mainScreen().bounds)
        feedScrollView.addSubview(self.feedImageView)
        feedScrollView.contentSize = feedImageView.frame.size
        
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
        
    }
    
    
    // GESTURE : TAP
    func didTap(sender:UITapGestureRecognizer) {
        
        selectedImageView = sender.view as UIImageView
        performSegueWithIdentifier("lightBoxSegue", sender: self)
        
    }
    
    // PREPARE SEGUE : SET VALUE
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        var destinationViewController = segue.destinationViewController as lightboxViewController
        destinationViewController.shownImage = self.selectedImageView.image
        
    }
    

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

    }
    


}
