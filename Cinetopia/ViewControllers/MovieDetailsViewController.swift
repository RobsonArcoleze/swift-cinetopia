//
//  MovieDetailsViewController.swift
//  Cinetopia
//
//  Created by MAC-0350 Multiportal on 21/10/24.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var movie: Movie
    
    private lazy var movieDetailTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = movie.title
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var movieDetailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: movie.image)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 36
        return imageView
    }()
    
    private lazy var movieDetailRateLbel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "Classificação dos Usuários: \(movie.rate)"
        return label
    }()
    
    private lazy var movieDetailsSynopsisLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white.withAlphaComponent(0.75)
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = movie.synopsis
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [movieDetailTitleLabel, movieDetailImageView, movieDetailRateLbel, movieDetailsSynopsisLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.alignment = .center
        return stackView
    }()
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(stackView)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            movieDetailTitleLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: -16),
            
            movieDetailImageView.widthAnchor.constraint(equalToConstant: 250),
            movieDetailImageView.heightAnchor.constraint(equalToConstant: 350),
            
            movieDetailsSynopsisLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16),
            movieDetailsSynopsisLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
            movieDetailsSynopsisLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -16),
            movieDetailsSynopsisLabel.topAnchor.constraint(equalTo: movieDetailRateLbel.bottomAnchor),
            
            ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


