//
//  DataProvider.swift
//  My CV
//
//  Created by Arthur Myronenko on 4/28/16.
//  Copyright © 2016 Arthur Myronenko. All rights reserved.
//

import UIKit

class DataProvider {
    func getWorkExamples() -> [WorkExample] {
        let first = WorkExample(name: "Speedometer",
                                icon: UIImage(named: "speedometer-icon")!,
                                description: "This app allows you to measure your acceleration speed and compete with your friends. Application contains CoreLocation code, interaction with remoter leaderboard server and sharing to the different social networks using their API.",
                                screenshot1: UIImage(named: "screen-speedometer-1")!,
                                screenshot2: UIImage(named: "screen-speedometer-2")!,
                                appStoreLink: NSURL(string: "itms-apps://itunes.apple.com/ua/app/spidometr-i-razgon-sorevnujsa/id1084341981")!)
        let second = WorkExample(name: "72 Hours",
                                icon: UIImage(named: "72hours-icon")!,
                                description: "Text-based quest in which you help fictional character escape from the maniac.  Shortly after release the game has taken top positions in the Russian App Store's Games section.",
                                screenshot1: UIImage(named: "screen-72hours-1")!,
                                screenshot2: UIImage(named: "screen-72hours-2")!,
                                appStoreLink: NSURL(string: "itms-apps://itunes.apple.com/ua/app/72-hours/id1081497641")!)
        let third = WorkExample(name: "Children Cards",
                                icon: UIImage(named: "cards-icon")!,
                                description: "Very simple chidlren game that can capture child's attention for hours. Allows children to look through different picttures and listen to related sounds. Very simple UI developed specially for children.",
                                screenshot1: UIImage(named: "screen-cards-1")!,
                                screenshot2: UIImage(named: "screen-cards-2")!,
                                appStoreLink: NSURL(string: "itms-apps://itunes.apple.com/ua/app/kartocki-so-zvukami-dla-detej/id1064030391")!)
        
        return [first, second, third]
    }
}