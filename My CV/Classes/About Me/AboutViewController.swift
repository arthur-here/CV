//
//  AboutViewController.swift
//  My CV
//
//  Created by Arthur Myronenko on 4/28/16.
//  Copyright © 2016 Arthur Myronenko. All rights reserved.
//

import UIKit

enum AboutData {
    case Photo(name: String)
    case Header(title: String)
    case About(text: String)
    case ListElement(text: String)
}

class AboutViewController: UITableViewController {

    var data: [AboutData] = [
        .Photo(name: "profile-picture"),
        .Header(title: "WHO I AM"),
        .About(text: "iOS Developer with experience in building outstanding apps from the ground up. I love the challenges that iOS development brings. Passionate in solving nontrivial tasks and working on the interesting projects with the latest available technologies to provide the best service to my customer."),
        .Header(title: "MY STRENGTHS"),
        .ListElement(text: "understanding of OOP and design patterns"),
        .ListElement(text: "concurrent programming and networking"),
        .ListElement(text: "hands-on experience with a lot of native frameworks and iOS SDK"),
        .ListElement(text: "active open-source community member"),
        .ListElement(text: "the desire to learn and to be on the crest of the wave of the constant tech growth")
    ]
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        title = "ABOUT ME"
    }
    
    private func cellIdentifierForIndexPath(indexPath: NSIndexPath) -> String {
        let record = data[indexPath.row]
        switch record {
        case .Photo(_): return Storyboard.Cells.Photo
        case .Header(_): return Storyboard.Cells.Header
        case .About(_): return Storyboard.Cells.About
        case .ListElement(_): return Storyboard.Cells.List
        }
    }
    
    private struct Storyboard {
        struct Cells {
            static let Photo = "Photo Cell"
            static let About = "About Cell"
            static let List = "List Cell"
            static let Header = "Header Cell"
        }
    }
}

// MARK: - UITableViewDataSource
extension AboutViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = cellIdentifierForIndexPath(indexPath)
        let record = data[indexPath.row]
        
        switch record {
        case .Photo(let name):
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! PhotoCell
            cell.setUserPhoto(UIImage(named: name)!)
            return cell
        case .Header(let title):
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! HeaderCell
            cell.setTitle(title)
            cell.slicedTitle.color = ColorsPalette.Red3
            return cell
        case .About(let text):
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! AboutCell
            cell.label.text = text
            return cell
        case .ListElement(let text):
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! ListBulletCell
            cell.label.text = text
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension AboutViewController {
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let identifier = cellIdentifierForIndexPath(indexPath)
        
        switch identifier {
        case Storyboard.Cells.Photo: return 130
        case Storyboard.Cells.Header: return 69
        case Storyboard.Cells.About: return UITableViewAutomaticDimension
        case Storyboard.Cells.List: return UITableViewAutomaticDimension
        default: return 40
        }
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
}
