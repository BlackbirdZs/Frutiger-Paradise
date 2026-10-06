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
    
    private lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "A place, where you can experince a glimpse of hope for a different world.\nFrutiger Aero imagined a future where technology was bright, gentle and alive.\n\nGen X Soft Club holds on to its afterglow.\n\nExplore the promises, images and feelings of a future that never arrived."
        textLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold, width: .expanded)
        textLabel.numberOfLines = .max
        textLabel.textColor = .white
        textLabel.backgroundColor = .clear
        return textLabel
    }()
    
    private lazy var goButton: UIButton = {
      let goButton = UIButton()
        goButton.translatesAutoresizingMaskIntoConstraints = false
        goButton.clipsToBounds = true
        guard let pixel = UIImage(named: "bluePixel") else { return goButton }
        let dimmedPixel = imageWithAlpha(pixel, alpha: 0.8)
        goButton.backgroundColor = .systemBlue
        goButton.setBackgroundImage(dimmedPixel, for: .highlighted)
        goButton.setBackgroundImage(dimmedPixel, for: .selected)
        goButton.layer.cornerRadius = 10
        goButton.setTitle("Explore", for: .normal)
        goButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .heavy, width: .expanded)
        goButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
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
        view.addSubview(textLabel)
        view.addSubview(goButton)
    }

    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -30),
            
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -140),
            
            goButton.widthAnchor.constraint(equalToConstant: 300),
            goButton.heightAnchor.constraint(equalToConstant: 60),
            goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        ])
    }
    
    @objc func buttonTap() {
        let mainVc = MainViewController()
        navigationController?.pushViewController(mainVc, animated: true)
    }
    
    func imageWithAlpha(_ image: UIImage, alpha: CGFloat) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: image.size)
        return renderer.image { _ in image.draw(at: .zero, blendMode: .normal, alpha: alpha)
        }
    }
}
