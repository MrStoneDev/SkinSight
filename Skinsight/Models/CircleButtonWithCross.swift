//
//  CircleButtonWithCross.swift
//  Skinsight
//
//  Created by Mario Alvarado on 25/07/23.
//

import UIKit

class CircleButtonWithCross: UIButton {
    
    //MARK: - Initialization
    
    // Create a initializer for the custom button
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    //MARK: - Helper function
    
    // This function configures the appearance of the button and adds the cross (X) inside it.
    private func setupButton() {
        // Set circular shape
        layer.cornerRadius = frame.width / 2
        layer.masksToBounds = true
        
        // Set the background color of the button
        backgroundColor = UIColor(red: 25/255.0, green: 167/255.0, blue: 206/255.0, alpha: 1.0)
        
        // Add the cross view
        let crossView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width * 0.6, height: 2))
        crossView.backgroundColor = .white
        crossView.center = CGPoint(x: frame.width / 2, y: frame.height / 2)
        addSubview(crossView)
        
        // Create a vertical cross view with a white background color and a height of 60% of the button's height.
        let verticalCrossView = UIView(frame: CGRect(x: 0, y: 0, width: 2, height: frame.height * 0.6))
        verticalCrossView.backgroundColor = .white
        verticalCrossView.center = CGPoint(x: frame.width / 2, y: frame.height / 2)
        addSubview(verticalCrossView)
    }
}

// Usage:
let circleButton = CircleButtonWithCross(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
