//
//  WelcomeViewController.swift
//  My CV
//
//  Created by Arthur Myronenko on 4/27/16.
//  Copyright © 2016 Arthur Myronenko. All rights reserved.

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var prettyImageView: PrettyImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUi()
    }
    
    private func setupUi() {
        prettyImageView.image = UIImage(named: "profile-picture")
        prettyImageView.animationDuration = 1.8
        prettyImageView.outlineColor = ColorsPalette.RedDefault
        prettyImageView.animate()

        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
