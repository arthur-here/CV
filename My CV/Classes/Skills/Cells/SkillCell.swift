//
//  SkillCell.swift
//  My CV
//
//  Created by Arthur Myronenko on 4/28/16.
//  Copyright © 2016 Arthur Myronenko. All rights reserved.
//

import UIKit

class SkillCell: UITableViewCell {

    @IBOutlet weak var skillNameLabel: UILabel!
    @IBOutlet weak var progressBar: ProgressBar!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        progressBar.update(true)
    }
}
