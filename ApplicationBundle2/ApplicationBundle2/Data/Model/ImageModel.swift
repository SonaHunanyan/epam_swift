//
//  ImageModel.swift
//  ApplicationBundle2
//
//  Created by Sona Hunanyan on 27.07.25.
//

struct ImageModel: Decodable {
    let id: String
    let urls: Urls
}

struct Urls: Decodable {
    let regular: String
}
