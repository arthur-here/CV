//
//  WelcomeViewController.swift
//  My CV
//
//  Created by Arthur Myronenko on 4/27/16.
//  Copyright © 2016 Arthur Myronenko. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var prettyImageView: PrettyImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        prettyImageView.image = UIImage(named: "profile-picture")
        prettyImageView.animationDuration = 1.0
        prettyImageView.outlineColor = ColorsPalette.RedDefault
        prettyImageView.animate()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
