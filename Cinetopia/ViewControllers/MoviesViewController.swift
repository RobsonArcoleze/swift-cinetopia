//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by MAC-0350 Multiportal on 17/10/24.
//

import UIKit

class MoviesViewController: UIViewController  {
    
    private var filteredMovies: [Movie] = []
    private var isSearchingActive: Bool = false
    private let moviesService: MoviesService = MoviesService()
    private var movies: [Movie] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "movieCell")
        return tableView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Pesquisar..."
        searchBar.searchTextField.backgroundColor = .white
        searchBar.delegate = self
        return searchBar
    }()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Pesquisar..."
        return searchController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        let tapGastureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismisskeyboard))
        view.addGestureRecognizer(tapGastureRecognizer)
        setupNaviagationBar()
        addSubviews()
        setupConstraints()
        fetchMovies()
    }
    
    private func fetchMovies(){
        moviesService.getMovies { result in
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    self.movies = movies
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }



        }
    }
    
    @objc private func dismisskeyboard() {
        searchBar.resignFirstResponder()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])

    }
    
    private func setupNaviagationBar() {
        title = "Filmes Poupulares"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.titleView = searchBar
    }

}


extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearchingActive ? filteredMovies.count : movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell {
            let movie = isSearchingActive ? filteredMovies[indexPath.row] : movies[indexPath.row]
            cell.configureCell(movie: movie)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movie = isSearchingActive ? filteredMovies[indexPath.row] : movies[indexPath.row]
        navigationController?.pushViewController(MovieDetailsViewController(movie: movie), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}


extension MoviesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            isSearchingActive = false
        }else{
            isSearchingActive = true
            filteredMovies = movies.filter({movie in
                movie.title.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
    
    private func searchBarShouldEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
