//
//  DiagnosisViewController.swift
//  Skinsight
//
//  Created by Mario Alvarado on 22/07/23.
//

import UIKit

class DiagnosisViewController: UIViewController {
    
    let diagnosisLabel = UILabel()
    var diagnosis: String? {
        didSet {
            DispatchQueue.main.async {
                self.diagnosisLabel.text = self.diagnosis ?? "No diagnosis"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diagnosisLabel.text = diagnosis ?? "No diagnosis" // Set the label text to the diagnosis if available, otherwise, show "No diagnosis"
        diagnosisLabel.font = UIFont(name: "Lato-Regular", size: 20.0)
        diagnosisLabel.textColor = UIColor.black
        
        diagnosisLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(diagnosisLabel)
        
        NSLayoutConstraint.activate([
            diagnosisLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            diagnosisLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100) // Adjust the constant value as needed
        ])
    }

}
