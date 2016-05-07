//
//  LinkLabel.swift
//  My CV
//
//  Created by Arthur Myronenko on 5/4/16.
//  Copyright © 2016 Arthur Myronenko. All rights reserved.
//

import UIKit

enum Link {
    case Phone(text: String)
    case Email(recipient: String, subject: String)
    case Web(url: NSURL)
}

@IBDesignable
class LinkLabel: UILabel {

    var link: Link?
    var tapHandler: (Link -> Void)? {
        didSet {
            userInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(LinkLabel.handleTap))
            addGestureRecognizer(tap)
        }
    }
    
    @IBInspectable
    var bottomLineVisible: Bool = false { didSet { setupUi() } }
    
    private lazy var bottomBorder: CALayer = {
        let border = CALayer()
        border.backgroundColor = ColorsPalette.RedDefault.CGColor
        border.frame = CGRect(x: 0, y: self.bounds.maxY, width: self.bounds.width, height: 3)
        self.layer.addSublayer(border)
        return border
    }()
    
    private func setupUi() {
        bottomBorder.hidden = !bottomLineVisible
        bottomBorder.frame = CGRect(x: 0, y: bounds.maxY, width: bounds.width, height: 3)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUi()
    }
    
    @objc func handleTap() {
        if let link = link, tapHandler = tapHandler {
            tapHandler(link)
        }
    }
}
