//
//  lightboxViewController.swift
//  fake-facebook
//
//  Created by Ed Chao on 2/24/15.
//  Copyright (c) 2015 edchao. All rights reserved.
//

import UIKit

class lightboxViewController: UIViewController {
    
    var shownImage : UIImage!
    var shownImageView: UIImageView!
    var doneButton: UIButton!
    var actionsImage: UIImage!
    var actionsImageView: UIImageView!
    
    var doneImage : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SHOWN IMAGE SETUP
        
        shownImageView = UIImageView(image:shownImage)
        shownImageView.frame = CGRect(x: 0, y: 50, width: 320, height: 470)
        shownImageView.userInteractionEnabled = true
        shownImageView.contentMode = .ScaleAspectFill
        shownImageView.clipsToBounds = true
        
        view.addSubview(shownImageView)
       
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
        

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func doneButtonTapped(sender:UIButton){
        dismissViewControllerAnimated(true, completion: nil)
    }


}
