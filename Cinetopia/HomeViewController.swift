//
//  ViewController.swift
//  Cinetopia
//
//  Created by MAC-0350 Multiportal on 11/10/24.
//

import UIKit

class HomeViewController: UIViewController {
    

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.logo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var coupleImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.couple)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "O lugar ideal para buscar, salvar e organizar seus filmes favoritos!"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var welcomeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Quero começar!", for: .normal)
        button.setTitleColor(.background, for: .normal)
        button.backgroundColor = .buttonBackgroundColoer
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 32
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logoImageView ,coupleImageView, welcomeLabel, welcomeButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.alignment = .center
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubiews()
        setupConstraints()
    }
    
    @objc private func buttonPressed(){
        navigationController?.pushViewController(MoviesViewController(), animated: true)
    }
    
    private func addSubiews(){
        view.addSubview(stackView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            welcomeButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -64),
            welcomeButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 64),
            
            welcomeButton.heightAnchor.constraint(equalToConstant: 64),
//            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
//            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            
//            coupleImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 32),
//            coupleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            
//            welcomeLabel.topAnchor.constraint(equalTo: coupleImageView.bottomAnchor, constant: 32),
//            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            
//            welcomeButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 32),
//            welcomeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
//            welcomeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
//            welcomeButton.heightAnchor.constraint(equalToConstant: 64)
            
        ])
    }

}

