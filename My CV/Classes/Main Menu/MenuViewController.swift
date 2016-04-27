//
//  MenuViewController.swift
//  My CV
//
//  Created by Arthur Myronenko on 4/27/16.
//  Copyright © 2016 Arthur Myronenko. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let buttonTitles = ["ABOUT ME", "WORK EXPERIENCE", "SKILLS", "EDUCATION", "CONTACT"]
        let buttonColors = [ColorsPalette.Red1, ColorsPalette.Red2, ColorsPalette.Red3, ColorsPalette.Red4, ColorsPalette.Red5]
        
        let margin: CGFloat = 60.0
        let buttonHeight: CGFloat = (view.frame.height - margin * 2 + 100) / 5.0
        let trapezeOffset: CGFloat = buttonHeight * 0.15
        
        for (i, title) in buttonTitles.enumerate() {
            let rect = CGRect(x: 0, y: margin + (buttonHeight - trapezeOffset - 3) * CGFloat(i), width: view.frame.width, height: buttonHeight)
            let button = TrapezeButton(frame: rect, trapezeOffset: trapezeOffset, direction: i % 2 == 0 ? .Left : .Right)
            button.setTitle(title, forState: .Normal)
            button.color = buttonColors[i]
            view.addSubview(button)
        }
    }

    override func prefersStatusBarHidden() -> Bool {
        return false
    }
}
