//
//  FavoritMoviesViewController.swift
//  Cinetopia
//
//  Created by MAC-0350 Multiportal on 24/10/24.
//

import UIKit

class FavoriteMovieUICollectionViewCell: UICollectionViewCell {
    
    // MARK: UI Components
    
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        //label.numberOfLines = 0
        return label
    }()
    
    private lazy var favoritButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let iconButton = UIImage(systemName: "heart.fill")?.withTintColor(.buttonBackgroundColoer, renderingMode: .alwaysOriginal)
        button.setImage(iconButton, for: .normal)
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        return button
    }()

    
    // MARK: View life cicle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .background
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Class methods
    private func addSubviews() {
        addSubview(moviePosterImageView)
        addSubview(movieTitleLabel)
        addSubview(favoritButton)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            moviePosterImageView.topAnchor.constraint(equalTo: topAnchor),
            moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            moviePosterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 140),
            
            movieTitleLabel.topAnchor.constraint(equalTo: moviePosterImageView.bottomAnchor, constant: 12),
            movieTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            favoritButton.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 12),
            favoritButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            favoritButton.heightAnchor.constraint(equalToConstant: 25),
            favoritButton.widthAnchor.constraint(equalToConstant: 25),
            
        ])
    }
    
    func setupView(_ movie: Movie){
        let url = URL(string: movie.image)
        moviePosterImageView.kf.setImage(with: url)
    }
    
    // MARK: IBAction
    @objc private func didTapBackButton(_ semder: UIButton){
        print(" did tap favorite button")
    }
}

