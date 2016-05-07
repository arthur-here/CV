//
//  ProgressBar.swift
//  My CV
//
//  Created by Arthur Myronenko on 4/28/16.
//  Copyright © 2016 Arthur Myronenko. All rights reserved.
//

import UIKit

class ProgressBar: UIView {

    var progressView: UIView!
    private var value: Double = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        backgroundColor = ColorsPalette.LightGray
        layer.cornerRadius = 6.0
        layer.masksToBounds = true
        
        progressView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width * CGFloat(value), height: frame.height))
        progressView.backgroundColor = ColorsPalette.Red5
        addSubview(progressView)
    }
    
    func setValue(value: Double, animated: Bool = false) {
        self.value = value
        if (animated) {
            UIView.animateWithDuration(0.5) {
                self.progressView.frame.size.width = self.frame.width * CGFloat(value)
            }
        } else {
            progressView.frame.size.width = frame.width * CGFloat(value)
        }
    }
}
