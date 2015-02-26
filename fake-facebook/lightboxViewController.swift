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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SHOWN IMAGE SETUP
        
        shownImageView = UIImageView(image:shownImage)
        shownImageView.frame = CGRect(x: 0, y: 30, width: 320, height: 500)
        shownImageView.userInteractionEnabled = true
        shownImageView.contentMode = .ScaleAspectFill
        shownImageView.clipsToBounds = true
        
        view.addSubview(shownImageView)
       
        // BUTTON SETUP
        
        doneButton = UIButton.buttonWithType(.System) as? UIButton
        doneButton.frame = CGRect(x: 110, y: 70, width: 100, height: 44)
        doneButton.setTitle("Press Me", forState: .Normal)
        doneButton.setTitle("I'm Pressed", forState: .Highlighted)
        doneButton.addTarget(self,
            action: "doneButtonTapped:",
            forControlEvents: .TouchUpInside)

        view.addSubview(doneButton)
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func doneButtonTapped(sender:UIButton){
        dismissViewControllerAnimated(true, completion: nil)
    }


}
