//
//  TermsModalView.swift
//  Skinsight
//
//  Created by Mario Alvarado on 27/07/23.
//

import Foundation
import UIKit

class TermsModalView: UIView {

    // Define UI elements
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Terms & Conditions"
        label.textAlignment = .center
        label.font = UIFont(name: "Lato-Regular", size: 18.0)
        label.textColor = UIColor(named: "modaltextColor")
        label.numberOfLines = 0 // Allow multiple lines
        return label
    }()
    
    let acceptButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Accept", for: .normal)
        button.tintColor = UIColor(named: "uploadbuttonsColor")
        return button
    }()
    
    // Unique property for the large text label
    let largeTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Lato-Regular", size: 16.0)
        label.textColor = UIColor(named: "modaltextColor")
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    // Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Setup UI elements
    private func setupViews() {
        backgroundColor = UIColor(named: "modalColor")
        layer.cornerRadius = 10.0 // Rounded corners
        
        // Add the UIScrollView to the modal view
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add UI elements to the scrollView
        scrollView.addSubview(label)
        scrollView.addSubview(largeTextLabel) // Add the largeTextLabel to the scrollView
        scrollView.addSubview(acceptButton)
        
        // Set constraints for UI elements
        label.translatesAutoresizingMaskIntoConstraints = false
        largeTextLabel.translatesAutoresizingMaskIntoConstraints = false // Translates Autoresizing Mask into Auto Layout Constraints
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // ScrollView Constraints
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // Terms & Conditions Label Constraints
            label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20), // Distance from top
            
            // Large Text Label Constraints
            largeTextLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            largeTextLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            largeTextLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20), // Distance from label
            largeTextLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32), // Adjust the constant as needed
            
            // Accept button Constraints
            acceptButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor), // Center horizontally in scrollView
            acceptButton.topAnchor.constraint(equalTo: largeTextLabel.bottomAnchor, constant: 20), // Distance from largeTextLabel
            acceptButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -5) // Distance from bottom
        ])
    }
}


