//
//  CustomTabBar.swift
//  Skinsight
//
//  Created by Mario Alvarado on 28/07/23.
//

import UIKit

class CustomTabBar: UITabBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAppearance()
    }

    private func setupAppearance() {

        self.backgroundColor = UIColor(red: 20/255.0, green: 108/255.0, blue: 148/255.0, alpha: 1.0)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 70
        return sizeThatFits
    }

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

