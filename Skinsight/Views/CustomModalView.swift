//
//  CustomModalView.swift
//  Skinsight
//
//  Created by Mario Alvarado on 25/07/23.
//

import UIKit

class CustomModalView: UIView {
    
    // Define UI elements
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Lato-Regular", size: 18.0)
        label.textColor = .black
        label.numberOfLines = 0 // Allow multiple lines
        return label
    }()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Close", for: .normal)
        return button
    }()
    
    let takePhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Take a photo", for: .normal)
        return button
    }()
    
    let uploadImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Upload an image", for: .normal)
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
        addSubview(closeButton)
        addSubview(takePhotoButton)
        addSubview(uploadImageButton)
        
        // Set constraints for UI elements
        label.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        takePhotoButton.translatesAutoresizingMaskIntoConstraints = false
        uploadImageButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            takePhotoButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            takePhotoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            takePhotoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            uploadImageButton.topAnchor.constraint(equalTo: takePhotoButton.bottomAnchor, constant: 10),
            uploadImageButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            uploadImageButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            uploadImageButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
    
    // Update label text
    func updateLabelText(text: String) {
        label.text = text
    }
}
