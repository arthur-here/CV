//
//  PhotoCell.swift
//  My CV
//
//  Created by Arthur Myronenko on 4/27/16.
//  Copyright © 2016 Arthur Myronenko. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

    @IBOutlet weak var photoView: PrettyImageView!
    
    func setUserPhoto(photo: UIImage) {
        photoView.image = photo
        photoView.animationDuration = 0.0
        photoView.outlineColor = ColorsPalette.RedDefault
        photoView.animate()
    }

}
