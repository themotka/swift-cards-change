//
//  ViewController.swift
//  test1
//
//  Created by Matthew Widemann on 09.09.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Constants
    private let images = ["Evelone", "Gorilla", "Makaka", "Pavian"]
    private let titles = ["Evelone", "Gorilla", "Makaka", "Pavian"]
    private var currentIndex = 0
        
    // MARK: - Properties
    
    // MARK: - Subviews
    
    let customView = UIView()
    
    private let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        private let titleLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            return label
        }()
        
        private let leftButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("←", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        private let rightButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("→", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    // MARK: - Init
    
    // MARK: - Methods
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI(){
        view.backgroundColor = .white
        
        view.addSubview(customView)
        view.layer.cornerRadius = 12
        customView.backgroundColor = .black
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        
        setupConstraints()
        updateContent()
        
        leftButton.addTarget(self, action: #selector(previousButtonTapped), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300),
                
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                
            leftButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            leftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                
            rightButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            rightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
        
    @objc private func previousButtonTapped() {
        currentIndex = (currentIndex - 1 + images.count) % images.count
        updateContent()
    }
        
    @objc private func nextButtonTapped() {
        currentIndex = (currentIndex + 1) % images.count
        updateContent()
    }
        
    private func updateContent() {
        imageView.image = UIImage(named: images[currentIndex])
        titleLabel.text = titles[currentIndex]
    }
}

