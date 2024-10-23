//
//  MoviesService.swift
//  Cinetopia
//
//  Created by MAC-0350 Multiportal on 23/10/24.
//

import Foundation

enum MoviesServiceError: Error {
    case invalidUrl
    case invalidResponse
    case decodingError
}


struct MoviesService {
    
    func getMovies(completion: @escaping (Result<[Movie], MoviesServiceError>) -> Void) {
        
        let urlStrting = "https://my-json-server.typicode.com/alura-cursos/movie-api/movies"
        guard let url = URL(string: urlStrting) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data,
                  let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200
            else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                completion(.success(movies))
            } catch {
                print(error)
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
  
}
