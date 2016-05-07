//
//  ContactViewController.swift
//  My CV
//
//  Created by Arthur Myronenko on 5/4/16.
//  Copyright © 2016 Arthur Myronenko. All rights reserved.
//

import UIKit
import MessageUI

class ContactViewController: UIViewController {

    @IBOutlet weak var phoneNumberLabel: LinkLabel! {
        didSet {
            phoneNumberLabel.link = Link.Phone(text: "380633346450")
            phoneNumberLabel.tapHandler = handleLink
        }
    }
    
    @IBOutlet weak var emailLabel: LinkLabel! {
        didSet {
            emailLabel.link = Link.Email(recipient: "arthur.myronenko@gmail.com", subject: "")
            emailLabel.tapHandler = handleLink
        }
    }
    
    @IBOutlet weak var githubLabel: LinkLabel! {
        didSet {
            githubLabel.link = Link.Web(url: NSURL(string: "https://github.com/burntheroad")!)
            githubLabel.tapHandler = handleLink
        }
    }
    
    @IBOutlet weak var vkLabel: LinkLabel! {
        didSet {
            vkLabel.link = Link.Web(url: NSURL(string: "https://vk.com/arthur_m")!)
            vkLabel.tapHandler = handleLink
        }
    }
    @IBOutlet weak var twitterLabel: LinkLabel! {
        didSet {
            twitterLabel.link = Link.Web(url: NSURL(string: "https://twitter.com/monkey_has_gone")!)
            twitterLabel.tapHandler = handleLink
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        title = "ABOUT ME"
    }
    
    private func handleLink(link: Link) {
        switch link {
        case .Phone(let phoneNumber):
            let url = NSURL(string: "tel://\(phoneNumber)")!
            UIApplication.sharedApplication().openURL(url)
        case .Email(let recipient, _):
            composeEmail(recipient)
        case .Web(let url):
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    private func composeEmail(recipient: String) { 
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        composeVC.setToRecipients([recipient])
        
        presentViewController(composeVC, animated: true, completion: nil)
    }
}

// MARK: - MFMailComposeViewControllerDelegate
extension ContactViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(controller: MFMailComposeViewController,
                               didFinishWithResult result: MFMailComposeResult,
                                                   error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}