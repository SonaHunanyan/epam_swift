//
//  TVShowsRepository.swift
//  Networking2
//
//  Created by Sona Hunanyan on 16.07.25.
//

import Foundation

class TVShowsRepository {
  static  private let apiKey = "7481bbcf1fcb56bd957cfe9af78205f3"
  static  private let baseURL = "https://api.themoviedb.org/3/tv/top_rated"
    
  static func getTVShows(completion: @escaping (Result<[TVShow], TVError>)-> Void) {
      guard var urlComponents = URLComponents(string: baseURL) else {
          completion(.failure(.invalidURL))
          return
      }
      urlComponents.queryItems = [
        URLQueryItem(name: "api_key", value: apiKey),
        URLQueryItem(name: "language", value: "en-US"),
        URLQueryItem(name: "page", value: "1")
      ]
      guard let url = urlComponents.url else {
          completion(.failure(.invalidURL))
          return
      }
      URLSession.shared.dataTask(with: url) { data, _, error in
          if let error = error {
              completion(.failure(.networkError(error)))
              return
          }
          guard let data = data else{
              completion(.failure(.unknown))
              return
          }
          do {
              let decoder = JSONDecoder()
              let tvShows = try decoder.decode(TVShowsResponse.self, from: data)
              completion(.success(tvShows.results))
          }
          catch  {
              completion(.failure(.decodingError))
          }
      }.resume()
    }
}
