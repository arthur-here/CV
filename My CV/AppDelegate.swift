//
//  AppDelegate.swift
//  My CV
//
//  Created by Arthur Myronenko on 4/26/16.
//  Copyright © 2016 Arthur Myronenko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        setupAppearance()
        
        return true
    }
    
    private func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = ColorsPalette.RedDefault
        UIPageControl.appearance().pageIndicatorTintColor = ColorsPalette.RedTransparent
        
    }
}

