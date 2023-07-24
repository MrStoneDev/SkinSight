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
        diagnosisVC.tabBarItem = UITabBarItem(title: "Diagnosis", image: UIImage(named: "test_icon"), tag: 0)
        scanVC.tabBarItem = UITabBarItem(title: "Scan", image: UIImage(named: "test_icon"), tag: 1)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "test_icon"), tag: 2)

        // Set the view controllers for the tab bar controller
        self.viewControllers = [diagnosisVC, scanVC, profileVC]
    }
}


