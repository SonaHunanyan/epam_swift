//
//  ImagesRepository.swift
//  ApplicationBundle2
//
//  Created by Sona Hunanyan on 27.07.25.
//

import Foundation

class ImagesRepository {
    static let instance = ImagesRepository()
    private let accessKey = "L2AD3_LKMg4hWhoMVKw5uljl3wHdQFODQQiapusWSas"
    private var urlString: String { return "https://api.unsplash.com/photos?client_id=\(accessKey)" }
    
    func getImages(completion: @escaping ([URL]) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let photos = try JSONDecoder().decode([ImageModel].self, from: data)
                let imageUrls = photos.compactMap { URL(string: $0.urls.regular) }
                completion(imageUrls)
            } catch {
                print(error)
            }
        }.resume()
    }
}
