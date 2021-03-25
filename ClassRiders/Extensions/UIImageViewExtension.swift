//
//  UIImageViewExtension.swift
//  ClassRiders
//
//  Created by Rober Garrido on 25/3/21.
//

import UIKit

extension UIImageView {
    func makeRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

