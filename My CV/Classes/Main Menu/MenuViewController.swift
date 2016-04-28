//
//  MenuViewController.swift
//  My CV
//
//  Created by Arthur Myronenko on 4/27/16.
//  Copyright © 2016 Arthur Myronenko. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var buttons = [TrapezeButton]()
    var lastSelectedButton: TrapezeButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setupButtons() {
        let buttonTitles = ["ABOUT ME", "WORK EXPERIENCE", "SKILLS", "EDUCATION", "CONTACT"]
        let buttonColors = [ColorsPalette.Red1, ColorsPalette.Red2, ColorsPalette.Red3, ColorsPalette.Red4, ColorsPalette.Red5]
        let selectors = ["showAbout", "showWorkExperience", "showSkills", "showEducation", "showContact"]
        
        let margin: CGFloat = 60.0
        let buttonHeight: CGFloat = (view.frame.height - margin * 2 + 100) / 5.0
        let trapezeOffset: CGFloat = buttonHeight * 0.15
        
        for (i, title) in buttonTitles.enumerate() {
            let rect = CGRect(x: 0, y: margin + (buttonHeight - trapezeOffset - 3) * CGFloat(i), width: view.frame.width, height: buttonHeight)
            let button = TrapezeButton(frame: rect, trapezeOffset: trapezeOffset, direction: i % 2 == 0 ? .Left : .Right)
            button.setTitle(title, forState: .Normal)
            button.color = buttonColors[i]
            button.addTarget("self", action: Selector(selectors[i]), forControlEvents: .TouchUpInside)
            view.addSubview(button)
            buttons.append(button)
        }
        
    }
    
    func showAbout() {
        performSegueWithIdentifier(Storyboard.Segues.About, sender: nil)
    }
    
    func showWorkExperience() {
//        performSegueWithIdentifier(Storyboard.Segues.WorkExperience, sender: nil)
    }
    
    func showSkills() {
//        performSegueWithIdentifier(Storyboard.Segues.Skills, sender: nil)
    }
    
    func showEducation() {
//        performSegueWithIdentifier(Storyboard.Segues.Education, sender: nil)
    }
    
    func showContact() {
//        performSegueWithIdentifier(Storyboard.Segues.Contact, sender: nil)
    }
    
    private struct Storyboard {
        struct Segues {
            static let About = "Show About"
            static let WorkExperience = "Show Work Experience"
            static let Skills = "Show Skills"
            static let Education = "Show Education"
            static let Contact = "Show Contact"
        }
    }
}
