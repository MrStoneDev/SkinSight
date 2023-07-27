//
//  TabBarController.swift
//  Skinsight
//
//  Created by Mario Alvarado on 22/07/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Get a reference to the main storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // Load the view controllers from the storyboard using their storyboard IDs
        let diagnosisVC = storyboard.instantiateViewController(withIdentifier: "DiagnosisID") as! DiagnosisViewController
        let scanVC = storyboard.instantiateViewController(withIdentifier: "ScanID") as! ScanViewController
        let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileID") as! ProfileViewController

        // Set up each view controller as a tab item
        diagnosisVC.tabBarItem = UITabBarItem(title: "Diagnosis", image: UIImage(named: "diagnosis_icon")?.withRenderingMode(.alwaysOriginal), tag: 0)
        scanVC.tabBarItem = UITabBarItem(title: "Scan", image: UIImage(named: "scan_icon")?.withRenderingMode(.alwaysOriginal), tag: 1)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile_icon")?.withRenderingMode(.alwaysOriginal), tag: 2)

        // Set the view controllers for the tab bar controller
        self.viewControllers = [diagnosisVC, scanVC, profileVC]
        
        // Customize the appearance of the tab bar
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = UIColor(red: 20/255.0, green: 108/255.0, blue: 148/255.0, alpha: 1.0)

        // Apply the customized appearance to the tab bar
        self.tabBar.standardAppearance = tabBarAppearance
        self.tabBar.scrollEdgeAppearance = tabBarAppearance
        
    }
}
