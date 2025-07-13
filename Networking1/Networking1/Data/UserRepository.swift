//
//  UserRepository.swift
//  Networking1
//
//  Created by Sona Hunanyan on 13.07.25.
//

import Foundation

final class UserRepository {
    static let shared = UserRepository(); private init() {}
    
    static  private let baseUrl = "https://jsonplaceholder.typicode.com/users"
    
    static  private let session = URLSession.shared
    
    static func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        guard let url = URL(string: baseUrl) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }
        
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data else {
                completion(.failure(NSError(domain: "Empty List", code: 0)))
                return
            }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
