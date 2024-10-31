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
    
    func getMovies() async throws -> [Movie] {
        
        let urlStrting = "https://my-json-server.typicode.com/alura-cursos/movie-api/movies"
        guard let url = URL(string: urlStrting) else {
            throw MoviesServiceError.invalidUrl
        }
        
        let(data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw MoviesServiceError.invalidResponse
        }
        do{
            let decoder = JSONDecoder()
            return try decoder.decode([Movie].self, from: data)
        } catch {
            throw MoviesServiceError.decodingError
        }
    }
  
}
