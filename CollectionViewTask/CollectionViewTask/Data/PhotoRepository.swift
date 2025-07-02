//
//  PhotoRepository.swift
//  CollectionViewTask
//
//  Created by Sona Hunanyan on 02.07.25.
//
import Foundation

class PhotoRepository {
    static func getPhotos() -> [Photo] {
        return [
            Photo(imageName: "image1", title: "Simpsons", date: Date(timeIntervalSince1970: 1640995200), isFavorite: false),
            Photo(imageName: "image2", title: "American Dad", date: Date(timeIntervalSince1970: 1672531200), isFavorite: true),
            Photo(imageName: "image3", title: "South park", date: Date(timeIntervalSince1970: 1675209600), isFavorite: false),
            Photo(imageName: "image4", title: "Bojack Horseman", date: Date(timeIntervalSince1970: 1680307200), isFavorite: false),
            Photo(imageName: "image5", title: "Toy story", date: Date(timeIntervalSince1970: 1682985600), isFavorite: true)
        ]
    }
}
