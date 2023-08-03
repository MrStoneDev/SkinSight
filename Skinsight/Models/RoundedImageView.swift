//
//  RoundedImageView.swift
//  Skinsight
//
//  Created by Mario Alvarado on 03/08/23.
//

import UIKit

class RoundedImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
    }
    
    private func updateCornerRadius() {
        layer.cornerRadius = frame.size.width / 2.0 // Use the width to create a perfect circle
        clipsToBounds = true
    }
}
