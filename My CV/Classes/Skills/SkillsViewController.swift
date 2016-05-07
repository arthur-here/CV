//
//  SkillsViewController.swift
//  My CV
//
//  Created by Arthur Myronenko on 4/28/16.
//  Copyright © 2016 Arthur Myronenko. All rights reserved.
//

import UIKit

private enum SkillData {
    case Header(title: String)
    case SkillCell(skill: Skill)
}

class SkillsViewController: UITableViewController {

    private let data = StubDataProvider().getSkills().reduce([]) { (total, value) -> [SkillData] in
        total + [SkillData.Header(title: value.0)] + value.1.map { SkillData.SkillCell(skill: $0) }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        title = "SKILLS"
    }
    
    private func cellIdentifierForIndexPath(indexPath: NSIndexPath) -> String {
        let record = data[indexPath.row]
        switch record {
        case .Header(_): return Storyboard.Cells.Header
        case .SkillCell(_): return Storyboard.Cells.Skill
        }
        
    }
    
    private struct Storyboard {
        struct Cells {
            static let Header = "Header Cell"
            static let Skill = "Skill Cell"
        }
    }
}

// MARK: - UITableViewDataSource
extension SkillsViewController {
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
        case .Header(let title):
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! HeaderCell
            cell.setTitle(title)
            return cell
        case .SkillCell(let skill):
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! SkillCell
            cell.skillNameLabel.text = skill.name
            cell.progressBar.setValue(skill.value, animated: true)
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension SkillsViewController {
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let identifier = cellIdentifierForIndexPath(indexPath)
        switch identifier {
        case Storyboard.Cells.Header: return 69
        case Storyboard.Cells.Skill: return UITableViewAutomaticDimension
        default: return 55
        }
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
}
