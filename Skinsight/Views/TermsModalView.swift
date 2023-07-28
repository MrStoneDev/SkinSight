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
    let label: UILabel = {
        let label = UILabel()
        label.text = "Terms & Conditions"
        label.textAlignment = .center
        label.font = UIFont(name: "Lato-Regular", size: 18.0)
        label.textColor = .black
        label.numberOfLines = 0 // Allow multiple lines
        return label
    }()
    
    let acceptButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Accept", for: .normal)
        return button
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
        backgroundColor = .white
        layer.cornerRadius = 10.0 // Rounded corners
        
        // Add UI elements to the modal view
        addSubview(label)
        addSubview(acceptButton)
        
        // Set constraints for UI elements
        label.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // Terms & Conditions Label Constraints
            label.centerXAnchor.constraint(equalTo: centerXAnchor), // Center horizontally
            label.topAnchor.constraint(equalTo: topAnchor, constant: 20), // Distance from top
            
            
            // Accept button Constraints
            acceptButton.centerXAnchor.constraint(equalTo: centerXAnchor), // Center horizontally
            acceptButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5) // Distance from bottom
        ])
    }
}
