//
//  WorkExampleViewController.swift
//  My CV
//
//  Created by Arthur Myronenko on 4/28/16.
//  Copyright © 2016 Arthur Myronenko. All rights reserved.
//

import UIKit

class WorkExampleViewController: UIViewController {

    @IBOutlet weak var appIconImageView: UIImageView! { didSet { updateUi() } }
    @IBOutlet weak var appNameLabel: UILabel! { didSet { updateUi() } }
    @IBOutlet weak var appDescriptionLabel: UILabel! { didSet { updateUi() } }
    @IBOutlet weak var screenshot1ImageView: UIImageView! { didSet { updateUi() } }
    @IBOutlet weak var screenshot2ImageView: UIImageView! { didSet { updateUi() } }

    var index = 0
    var example: WorkExample? {
        didSet {
            updateUi()
        }
    }
    
    private func updateUi() {
        guard let example = example else { return }
        
        appNameLabel?.text = example.name
        appIconImageView?.image = example.icon
        appDescriptionLabel?.text = example.description
        screenshot1ImageView?.image = example.screenshot1
        screenshot2ImageView?.image = example.screenshot2
    }
    
    @IBAction func openInAppStore() {
        guard let example = example else { return }
        UIApplication.sharedApplication().openURL(example.appStoreLink)
    }
}
