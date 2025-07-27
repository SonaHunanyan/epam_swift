//
//  Familiy.swift
//  ApplicationBundle3
//
//  Created by Sona Hunanyan on 27.07.25.
//


struct FamilyMember: Decodable {
    let name: String
    let age: Int
    let relation: String
    let imageName: String
}

struct FamilyResponse: Decodable {
    let family: [FamilyMember]
}
