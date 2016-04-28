//
//  HeaderCell.swift
//  My CV
//
//  Created by Arthur Myronenko on 4/27/16.
//  Copyright © 2016 Arthur Myronenko. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var slicedTitle: SlicedView!
    
    func setTitle(title: String) {
        self.slicedTitle.label.text = title
    }
    
}
