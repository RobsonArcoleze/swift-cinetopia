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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubiews()
        setupConstraints()
    }
    
    private func addSubiews(){
        view.addSubview(logoImageView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

}

