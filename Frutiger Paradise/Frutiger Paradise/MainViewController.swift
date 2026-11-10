//
//  MainViewController.swift
//  Frutiger Paradise
//
//  Created by Anton Kruglov on 02.10.2026.
//

import AVFoundation
import Foundation
import UIKit

class MainViewController: UIViewController {
    fileprivate let cards = ParadiseCard.make()
    
    private lazy var cardCollection: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        
        let cardCollection = UICollectionView(
            frame: .zero,
            collectionViewLayout: viewLayout
        )
        cardCollection.backgroundColor = .clear
        cardCollection.translatesAutoresizingMaskIntoConstraints = false
        cardCollection.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "card")
        return cardCollection
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Archive of a promised future"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold, width: .expanded)
        titleLabel.numberOfLines = .max
        return titleLabel
    }()
    
    private lazy var belowLabel: UILabel = {
        let belowLabel = UILabel()
        belowLabel.translatesAutoresizingMaskIntoConstraints = false
        belowLabel.text = "Tap a memory to open its story"
        belowLabel.textColor = .white
        belowLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold, width: .expanded)
        
        return belowLabel
    }()
    
    private lazy var trackLabel: UILabel = {
        let trackLabel = UILabel()
        //        let songName = tracks[currentTrackIndex]
        trackLabel.translatesAutoresizingMaskIntoConstraints = false
        trackLabel.clipsToBounds = true
        trackLabel.layer.cornerRadius = 30
        trackLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        trackLabel.textAlignment = .center
        trackLabel.textColor = .white
        
        return trackLabel
    }()
    
    private lazy var playButton: UIButton = {
        let playButton = UIButton()
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.clipsToBounds = true
        playButton.layer.cornerRadius = 20
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        
        return playButton
    }()
    
    private lazy var playImageViewEmpty: UIImageView = {
        let playImageViewEmpty = UIImageView()
        playImageViewEmpty.translatesAutoresizingMaskIntoConstraints = false
        playImageViewEmpty.image = UIImage(systemName: "play")
        playImageViewEmpty.isHidden = false
        playImageViewEmpty.backgroundColor = .clear
        playImageViewEmpty.tintColor = .white
        
        return playImageViewEmpty
    }()
    
    private lazy var playImageViewFilled: UIImageView = {
        let playImageViewFilled = UIImageView()
        playImageViewFilled.translatesAutoresizingMaskIntoConstraints = false
        playImageViewFilled.image = UIImage(systemName: "play.fill")
        playImageViewFilled.isHidden = true
        playImageViewFilled.backgroundColor = .clear
        playImageViewFilled.tintColor = .white
        
        return playImageViewFilled
    }()
    
    private lazy var pauseButton: UIButton = {
        let pauseButton = UIButton()
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        pauseButton.clipsToBounds = true
        pauseButton.layer.cornerRadius = 20
        pauseButton.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
        
        return pauseButton
    }()
    
    private lazy var pauseImageViewEmpty: UIImageView = {
        let pauseImageViewEmpty = UIImageView()
        pauseImageViewEmpty.translatesAutoresizingMaskIntoConstraints = false
        pauseImageViewEmpty.image = UIImage(systemName: "pause")
        pauseImageViewEmpty.backgroundColor = .clear
        pauseImageViewEmpty.isHidden = false
        pauseImageViewEmpty.tintColor = .white
        
        return pauseImageViewEmpty
    }()
    
    private lazy var pauseImageViewFilled: UIImageView = {
        let pauseImageViewFilled = UIImageView()
        pauseImageViewFilled.translatesAutoresizingMaskIntoConstraints = false
        pauseImageViewFilled.image = UIImage(systemName: "pause.fill")
        pauseImageViewFilled.backgroundColor = .clear
        pauseImageViewFilled.isHidden = true
        pauseImageViewFilled.tintColor = .white
        
        return pauseImageViewFilled
    }()
    
    private lazy var stopButton: UIButton = {
        let stopButton = UIButton()
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.clipsToBounds = true
        stopButton.layer.cornerRadius = 20
        stopButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        
        return stopButton
    }()
    
    private lazy var stopImageViewEmpty: UIImageView = {
        let stopImageViewEmpty = UIImageView()
        stopImageViewEmpty.translatesAutoresizingMaskIntoConstraints = false
        stopImageViewEmpty.image = UIImage(systemName: "stop")
        stopImageViewEmpty.isHidden = false
        stopImageViewEmpty.backgroundColor = .clear
        stopImageViewEmpty.tintColor = .white
        
        return stopImageViewEmpty
    }()
    
    private lazy var stopImageViewFilled: UIImageView = {
        let stopImageViewFilled = UIImageView()
        stopImageViewFilled.translatesAutoresizingMaskIntoConstraints = false
        stopImageViewFilled.image = UIImage(systemName: "stop.fill")
        stopImageViewFilled.isHidden = true
        stopImageViewFilled.backgroundColor = .clear
        stopImageViewFilled.tintColor = .white
        
        return stopImageViewFilled
    }()
    
    private lazy var nextTrackButton: UIButton = {
        let nextTrackButton = UIButton()
        nextTrackButton.translatesAutoresizingMaskIntoConstraints = false
        nextTrackButton.clipsToBounds = true
        nextTrackButton.layer.cornerRadius = 20
        nextTrackButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        return nextTrackButton
    }()
    
    private lazy var nextTrackViewEmpty: UIImageView = {
        let nextTrackViewEmpty = UIImageView()
        nextTrackViewEmpty.translatesAutoresizingMaskIntoConstraints = false
        nextTrackViewEmpty.image = UIImage(systemName: "forward")
        nextTrackViewEmpty.isHidden = false
        nextTrackViewEmpty.backgroundColor = .clear
        nextTrackViewEmpty.tintColor = .white
        
        return nextTrackViewEmpty
    }()
    
    private lazy var nextTrackViewFilled: UIImageView = {
        let nextTrackViewEmpty = UIImageView()
        nextTrackViewEmpty.translatesAutoresizingMaskIntoConstraints = false
        nextTrackViewEmpty.image = UIImage(systemName: "forward.fill")
        nextTrackViewEmpty.isHidden = true
        nextTrackViewEmpty.backgroundColor = .clear
        nextTrackViewEmpty.tintColor = .white
        
        return nextTrackViewEmpty
    }()
    
    private lazy var previousTrackButton: UIButton = {
        let previousTrackButton = UIButton()
        previousTrackButton.translatesAutoresizingMaskIntoConstraints = false
        previousTrackButton.clipsToBounds = true
        previousTrackButton.layer.cornerRadius = 20
        previousTrackButton.addTarget(self, action: #selector(previousButtonTapped), for: .touchUpInside)

        return previousTrackButton
    }()
    
    private lazy var previousTrackViewEmpty: UIImageView = {
        let nextTrackViewEmpty = UIImageView()
        nextTrackViewEmpty.translatesAutoresizingMaskIntoConstraints = false
        nextTrackViewEmpty.image = UIImage(systemName: "backward")
        nextTrackViewEmpty.isHidden = false
        nextTrackViewEmpty.backgroundColor = .clear
        nextTrackViewEmpty.tintColor = .white
        
        return nextTrackViewEmpty
    }()
    
    private lazy var previousTrackViewFilled: UIImageView = {
        let previousTrackViewFilled = UIImageView()
        previousTrackViewFilled.translatesAutoresizingMaskIntoConstraints = false
        previousTrackViewFilled.image = UIImage(systemName: "backward.fill")
        previousTrackViewFilled.isHidden = true
        previousTrackViewFilled.backgroundColor = .clear
        previousTrackViewFilled.tintColor = .white
        
        return previousTrackViewFilled
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        setupCollectionView()
        setupConstraints()
    }
    
    func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(cardCollection)
        view.addSubview(belowLabel)
        view.addSubview(previousTrackButton)
        view.addSubview(playButton)
        view.addSubview(pauseButton)
        view.addSubview(stopButton)
        view.addSubview(nextTrackButton)
        view.addSubview(trackLabel)
        playButton.addSubview(playImageViewEmpty)
        playButton.addSubview(playImageViewFilled)
        pauseButton.addSubview(pauseImageViewEmpty)
        pauseButton.addSubview(pauseImageViewFilled)
        stopButton.addSubview(stopImageViewEmpty)
        stopButton.addSubview(stopImageViewFilled)
        nextTrackButton.addSubview(nextTrackViewEmpty)
        nextTrackButton.addSubview(nextTrackViewFilled)
        previousTrackButton.addSubview(previousTrackViewEmpty)
        previousTrackButton.addSubview(previousTrackViewFilled)
    }
    
    func setupCollectionView() {
        cardCollection.delegate = self
        cardCollection.dataSource = self
    }

    func setupView() {
        view.backgroundColor = .black
    }
    
    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 35),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            cardCollection.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            cardCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cardCollection.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -220),
            
            belowLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            belowLabel.topAnchor.constraint(equalTo: cardCollection.bottomAnchor, constant: 5),
            
            trackLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            trackLabel.topAnchor.constraint(equalTo: belowLabel.bottomAnchor, constant: 50),
            trackLabel.widthAnchor.constraint(equalToConstant: 300),
            trackLabel.heightAnchor.constraint(equalToConstant: 70),
            
            playButton.leadingAnchor.constraint(equalTo: previousTrackButton.trailingAnchor, constant: 10),
            playButton.topAnchor.constraint(equalTo: belowLabel.bottomAnchor, constant: 120),
            playButton.widthAnchor.constraint(equalToConstant: 80),
            playButton.heightAnchor.constraint(equalTo: playButton.widthAnchor),
            
            playImageViewEmpty.widthAnchor.constraint(equalToConstant: 20),
            playImageViewEmpty.heightAnchor.constraint(equalTo: playImageViewEmpty.widthAnchor),
            playImageViewEmpty.centerXAnchor.constraint(equalTo: playButton.centerXAnchor),
            playImageViewEmpty.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            
            playImageViewFilled.widthAnchor.constraint(equalToConstant: 20),
            playImageViewFilled.heightAnchor.constraint(equalTo: playImageViewEmpty.widthAnchor),
            playImageViewFilled.centerXAnchor.constraint(equalTo: playButton.centerXAnchor),
            playImageViewFilled.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            
            pauseButton.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 5),
            pauseButton.topAnchor.constraint(equalTo: playButton.topAnchor),
            pauseButton.widthAnchor.constraint(equalTo: playButton.widthAnchor),
            pauseButton.heightAnchor.constraint(equalTo: playButton.widthAnchor),
            
            pauseImageViewEmpty.widthAnchor.constraint(equalToConstant: 20),
            pauseImageViewEmpty.heightAnchor.constraint(equalTo: pauseImageViewEmpty.widthAnchor),
            pauseImageViewEmpty.centerXAnchor.constraint(equalTo: pauseButton.centerXAnchor),
            pauseImageViewEmpty.centerYAnchor.constraint(equalTo: pauseButton.centerYAnchor),
            
            pauseImageViewFilled.widthAnchor.constraint(equalToConstant: 20),
            pauseImageViewFilled.heightAnchor.constraint(equalTo: pauseImageViewFilled.widthAnchor),
            pauseImageViewFilled.centerXAnchor.constraint(equalTo: pauseButton.centerXAnchor),
            pauseImageViewFilled.centerYAnchor.constraint(equalTo: pauseButton.centerYAnchor),
            
            stopButton.leadingAnchor.constraint(equalTo: pauseButton.trailingAnchor, constant: 5),
            stopButton.topAnchor.constraint(equalTo: playButton.topAnchor),
            stopButton.widthAnchor.constraint(equalTo: playButton.widthAnchor),
            stopButton.heightAnchor.constraint(equalTo: playButton.widthAnchor),
            
            stopImageViewEmpty.widthAnchor.constraint(equalToConstant: 20),
            stopImageViewEmpty.heightAnchor.constraint(equalTo: stopImageViewEmpty.widthAnchor),
            stopImageViewEmpty.centerXAnchor.constraint(equalTo: stopButton.centerXAnchor),
            stopImageViewEmpty.centerYAnchor.constraint(equalTo: stopButton.centerYAnchor),
            
            stopImageViewFilled.widthAnchor.constraint(equalToConstant: 20),
            stopImageViewFilled.heightAnchor.constraint(equalTo: stopImageViewFilled.widthAnchor),
            stopImageViewFilled.centerXAnchor.constraint(equalTo: stopButton.centerXAnchor),
            stopImageViewFilled.centerYAnchor.constraint(equalTo: stopButton.centerYAnchor),
            
            previousTrackButton.topAnchor.constraint(equalTo: playButton.topAnchor),
            previousTrackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            previousTrackButton.widthAnchor.constraint(equalTo: playButton.widthAnchor),
            previousTrackButton.heightAnchor.constraint(equalTo: playButton.widthAnchor),
            
            previousTrackViewEmpty.widthAnchor.constraint(equalToConstant: 20),
            previousTrackViewEmpty.heightAnchor.constraint(equalTo: previousTrackViewEmpty.widthAnchor),
            previousTrackViewEmpty.centerXAnchor.constraint(equalTo: previousTrackButton.centerXAnchor),
            previousTrackViewEmpty.centerYAnchor.constraint(equalTo: previousTrackButton.centerYAnchor),
            
            previousTrackViewFilled.widthAnchor.constraint(equalToConstant: 20),
            previousTrackViewFilled.heightAnchor.constraint(equalTo: previousTrackViewFilled.widthAnchor),
            previousTrackViewFilled.centerXAnchor.constraint(equalTo: previousTrackButton.centerXAnchor),
            previousTrackViewFilled.centerYAnchor.constraint(equalTo: previousTrackButton.centerYAnchor),
            
            nextTrackButton.topAnchor.constraint(equalTo: playButton.topAnchor),
            nextTrackButton.leadingAnchor.constraint(equalTo: stopButton.trailingAnchor, constant: 10),
            nextTrackButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextTrackButton.widthAnchor.constraint(equalTo: playButton.widthAnchor),
            nextTrackButton.heightAnchor.constraint(equalTo: playButton.widthAnchor),
            
            nextTrackViewEmpty.widthAnchor.constraint(equalToConstant: 20),
            nextTrackViewEmpty.heightAnchor.constraint(equalTo: nextTrackViewEmpty.widthAnchor),
            nextTrackViewEmpty.centerXAnchor.constraint(equalTo: nextTrackButton.centerXAnchor),
            nextTrackViewEmpty.centerYAnchor.constraint(equalTo: nextTrackButton.centerYAnchor),
            
            nextTrackViewFilled.widthAnchor.constraint(equalToConstant: 20),
            nextTrackViewFilled.heightAnchor.constraint(equalTo: nextTrackViewEmpty.widthAnchor),
            nextTrackViewFilled.centerXAnchor.constraint(equalTo: nextTrackButton.centerXAnchor),
            nextTrackViewFilled.centerYAnchor.constraint(equalTo: nextTrackButton.centerYAnchor),
        ])
    }
    
    @objc func playButtonTapped() {
        playButtonSetup()
        
    }
    
    @objc func pauseButtonTapped() {
        pauseButtonSetup()
        
    }
    
    @objc func stopButtonTapped() {
        stopButtonSetup()
        
    }
    
    @objc func nextButtonTapped() {
        nextTrackViewEmpty.isHidden = true
        nextTrackViewFilled.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.nextTrackViewFilled.isHidden = true
            self.nextTrackViewEmpty.isHidden = false
        }
    }
    
    @objc func previousButtonTapped() {
        previousTrackViewEmpty.isHidden = true
        previousTrackViewFilled.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.previousTrackViewFilled.isHidden = true
            self.previousTrackViewEmpty.isHidden = false
        }
    }
    
    func playButtonSetup() {
        playImageViewEmpty.isHidden = true
        playImageViewFilled.isHidden = false
        pauseImageViewEmpty.isHidden = false
        pauseImageViewFilled.isHidden = true
        stopImageViewEmpty.isHidden = false
        stopImageViewFilled.isHidden = true
    }
    
    func pauseButtonSetup() {
        playImageViewEmpty.isHidden = false
        playImageViewFilled.isHidden = true
        pauseImageViewEmpty.isHidden = true
        pauseImageViewFilled.isHidden = false
        stopImageViewEmpty.isHidden = false
        stopImageViewFilled.isHidden = true
    }
    
    func stopButtonSetup() {
        stopImageViewEmpty.isHidden = true
        stopImageViewFilled.isHidden = false
        playImageViewEmpty.isHidden = false
        playImageViewFilled.isHidden = true
        pauseImageViewEmpty.isHidden = false
        pauseImageViewFilled.isHidden = true
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemHeight = collectionView.bounds.height * 0.9
        let itemWidth = collectionView.bounds.width - 170
        return CGSize(width: itemWidth, height: itemHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath) as? CardCollectionViewCell else {
            fatalError("could not dequeueReusableCell")
        }
        cell.configure(with: cards[indexPath.item])
        return cell
    }
}

