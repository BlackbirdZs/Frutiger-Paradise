//
//  ViewController.swift
//  Frutiger Paradise
//
//  Created by Anton Kruglov on 30.09.2026.
//

import UIKit

class WelcomeViewController: UIViewController {

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Welcome to Frutiger Paradise"
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy, width: .expanded)
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .white
        titleLabel.backgroundColor = .clear
        return titleLabel
    }()
    
    private lazy var goButton: UIButton = {
      let goButton = UIButton()
        goButton.translatesAutoresizingMaskIntoConstraints = false
        goButton.clipsToBounds = true
        goButton.backgroundColor = .systemBlue
        goButton.layer.cornerRadius = 10
        goButton.setTitle("Explore", for: .normal)
        return goButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addSubviews()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = .black
    }

    func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(goButton)
    }

    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -30),
            
            goButton.widthAnchor.constraint(equalToConstant: 300),
            goButton.heightAnchor.constraint(equalToConstant: 60),
            goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        ])
    }
}
