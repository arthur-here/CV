//
//  TrapezeButton.swift
//  My CV
//
//  Created by Arthur Myronenko on 4/27/16.
//  Copyright © 2016 Arthur Myronenko. All rights reserved.
//

import UIKit

enum TrapezeButtonDirection {
    case Left, Right
}

class TrapezeButton: UIButton {

    let trapezeOffset: CGFloat
    let direction: TrapezeButtonDirection
    var color = ColorsPalette.RedDefault
    
    init(frame: CGRect, trapezeOffset: CGFloat, direction: TrapezeButtonDirection) {
        self.trapezeOffset = trapezeOffset
        self.direction = direction
        super.init(frame: frame)
        setupUi()
    }
    
    convenience init(frame: CGRect, trapezeOffsetPercent: Double, direction: TrapezeButtonDirection) {
        self.init(frame: frame, trapezeOffset: frame.height * CGFloat(trapezeOffsetPercent), direction: direction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.trapezeOffset = 10.0
        self.direction = .Right
        super.init(coder: aDecoder)
        setupUi()
    }
    
    private func setupUi() {
        self.opaque = true
        self.titleLabel?.font = UIFont(name: "ProximaNova-Bold", size: 23.0)
        self.tintColor = ColorsPalette.GrayText
        self.backgroundColor = .clearColor()
        self.layer.shouldRasterize = true
    }
    
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath()
        
        path.moveToPoint(CGPoint(x: 0, y: 0))
        path.addLineToPoint(CGPoint(x: 0, y: rect.height))
        path.addLineToPoint(CGPoint(x: rect.width, y: rect.height - trapezeOffset))
        path.addLineToPoint(CGPoint(x: rect.width, y: trapezeOffset))
        
        if direction == .Left {
            let flipOverX = CGAffineTransformMakeScale(-1.0, 1.0)
            let translate = CGAffineTransformMakeTranslation(rect.width, 0)
            
            path.applyTransform(flipOverX)
            path.applyTransform(translate)
        }
        
        path.addClip()
        
        color.setFill()
        path.fill()
    }

}
