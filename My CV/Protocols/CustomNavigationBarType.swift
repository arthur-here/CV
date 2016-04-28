//
//  CustomNavigationBarType.swift
//  My CV
//
//  Created by Arthur Myronenko on 4/28/16.
//  Copyright © 2016 Arthur Myronenko. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupNavigationBar() {
        guard let navigationController = navigationController else { return }
        let navigationBar = navigationController.navigationBar
        
        navigationController.setNavigationBarHidden(false, animated: true)
        
        navigationBar.translucent = false
        navigationBar.backIndicatorImage = UIImage(named: "back-arrow")
        navigationBar.backItem?.title = ""
        
        navigationBar.shadowImage = UIImage()
        navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        
        navigationBar.tintColor = ColorsPalette.DarkGrayText
        navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "ProximaNova-Bold", size: 23.0)! ]
        navigationBar.barTintColor = ColorsPalette.GrayBackground
    }
}
