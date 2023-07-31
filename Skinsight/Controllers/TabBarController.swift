//
//  TabBarController.swift
//  Skinsight
//
//  Created by Mario Alvarado on 22/07/23.
//

import UIKit

// This is a class to create and manage a tab bar, taking the tabs directly from the controllers.
class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Get a reference to the main storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // Load the view controllers from the storyboard using their storyboard IDs
        let diagnosisVC = storyboard.instantiateViewController(withIdentifier: "DiagnosisID") as! DiagnosisViewController
        let scanVC = storyboard.instantiateViewController(withIdentifier: "ScanID") as! ScanViewController
        let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileID") as! ProfileViewController

        // Set up each view controller as a tab item, each tab has an icon for unselected, and selected states
        diagnosisVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "diagnosis_icon")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "diagnosis_selected")?.withRenderingMode(.alwaysOriginal))
        scanVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "scan_icon")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "scan_selected")?.withRenderingMode(.alwaysOriginal))
        profileVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "profile_icon")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "profile_selected")?.withRenderingMode(.alwaysOriginal))

        // Set the view controllers for the tab bar controller
        self.viewControllers = [diagnosisVC, scanVC, profileVC]

        // Set the custom TabBar subclass
        self.setValue(CustomTabBar(), forKey: "tabBar")
    }
}

