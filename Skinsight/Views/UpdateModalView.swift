//
//  CustomModalView.swift
//  Skinsight
//
//  Created by Mario Alvarado on 25/07/23.
//

import UIKit

class UpdateModalView: UIView {
    
    // Define UI elements
    let label: UILabel = {
        let label = UILabel()
        label.text = """
        Upload the
        image you want
        to be scanned
        """
        label.textAlignment = .center
        label.font = UIFont(name: "Lato-Regular", size: 18.0)
        label.textColor = UIColor(named: "modaltextColor")
        label.numberOfLines = 0 // Allow multiple lines
        return label
    }()
    
    let importantLabel: UILabel = {
        let label = UILabel()
        label.text = "You MUST upload an image of the skin"
        label.textAlignment = .center
        label.font = UIFont(name: "Lato-Regular", size: 18.0)
        label.textColor = UIColor.red
        label.numberOfLines = 0 // Allow multiple lines
        return label
    }()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Close", for: .normal)
        button.tintColor = UIColor(named: "uploadbuttonsColor")
        return button
    }()
    
    let takePhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Take a photo", for: .normal)
        button.tintColor = UIColor(named: "uploadbuttonsColor")
        return button
    }()
    
    let selectImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Select an image", for: .normal)
        button.tintColor = UIColor(named: "uploadbuttonsColor")
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
        backgroundColor = UIColor(named: "modalColor")
        layer.cornerRadius = 10.0 // Rounded corners
        
        // Add UI elements to the modal view
        addSubview(label)
        addSubview(importantLabel)
        addSubview(closeButton)
        addSubview(takePhotoButton)
        addSubview(selectImageButton)
        
        // Set constraints for UI elements
        label.translatesAutoresizingMaskIntoConstraints = false
        importantLabel.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        takePhotoButton.translatesAutoresizingMaskIntoConstraints = false
        selectImageButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            importantLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            importantLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            importantLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            importantLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            takePhotoButton.topAnchor.constraint(equalTo: importantLabel.bottomAnchor, constant: 40),
            takePhotoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            takePhotoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            selectImageButton.topAnchor.constraint(equalTo: takePhotoButton.bottomAnchor, constant: 10),
            selectImageButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            selectImageButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            selectImageButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
}
