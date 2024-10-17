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
        return imageView
    }()
    
    private lazy var coupleImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.couple)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubiews()
        setupConstraints()
    }
    
    private func addSubiews(){
        view.addSubview(logoImageView)
        view.addSubview(coupleImageView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            coupleImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 32),
            coupleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}

