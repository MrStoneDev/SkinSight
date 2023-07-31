//
//  CustomTabBar.swift
//  Skinsight
//
//  Created by Mario Alvarado on 28/07/23.
//

import UIKit

// A custom subclass of UITabBar that provides a customized appearance and layout for tab bar items.
class CustomTabBar: UITabBar {
    
    // Initializes the custom tab bar with the given frame. This method is called when the tab bar is created programmatically.
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
    }
    
    // Initializes the custom tab bar with the given coder. This method is called when the tab bar is created from a storyboard or a nib file.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAppearance()
    }
    
    // Sets up the appearance of the custom tab bar, including background color.
    private func setupAppearance() {

        self.backgroundColor = UIColor(red: 20/255.0, green: 108/255.0, blue: 148/255.0, alpha: 1.0)
    }

    //  Returns the size that best fits the specified size.
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 70
        return sizeThatFits
    }
    
    /**
    Adjusts the layout of subviews to position the tab bar items vertically.

    This method is called whenever the layout of the tab bar needs to be updated, such as when the device orientation changes.
    */
    override func layoutSubviews() {
        super.layoutSubviews()

        // Adjust the vertical position of the tab bar items
        let tabBarHeight = bounds.height
        let itemHeight = tabBarHeight / CGFloat(items?.count ?? 1)

        // Loop through the subviews and find the UITabBarButton items
        for subview in self.subviews {
            if let tabBarButtonClass = NSClassFromString("UITabBarButton"), subview.isKind(of: tabBarButtonClass) {
                // Update the content insets of the tab bar item to move it closer to the bottom
                var newInsets = subview.bounds.height - itemHeight
                newInsets /= 2.0
                subview.frame.origin.y = newInsets
            }
        }
    }
}
