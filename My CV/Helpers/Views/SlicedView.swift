//
//  SlicedView.swift
//  My CV
//
//  Created by Arthur Myronenko on 4/27/16.
//  Copyright © 2016 Arthur Myronenko. All rights reserved.
//

import UIKit

class SlicedView: UIView {
    
    var color = ColorsPalette.RedDefault
    var label: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUi()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUi()
    }
    
    private func setupUi() {
        let labelFrame = CGRect(x: 24, y: 0, width: frame.width - 20, height: frame.height)
        label = UILabel(frame: labelFrame)
        label.font = UIFont(name: "ProximaNova-Bold", size: 18.0)
        label.textColor = ColorsPalette.GrayText
        label.textAlignment = .Left
        addSubview(label)
        
        opaque = true
        backgroundColor = .clearColor()
        layer.shouldRasterize = true
    }

    override func drawRect(rect: CGRect) {
        
        let offset = rect.height / 10.0
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: rect.height))
        path.addLineToPoint(CGPoint(x: rect.width, y: rect.height - offset))
        path.addLineToPoint(CGPoint(x: rect.width, y: 0))
        path.addLineToPoint(CGPoint(x: 0, y: offset))
        path.addClip()
        
        color.setFill()
        path.fill()
    }

}
