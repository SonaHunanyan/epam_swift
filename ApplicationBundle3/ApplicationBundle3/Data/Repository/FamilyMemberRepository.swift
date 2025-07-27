//
//  Untitled.swift
//  ApplicationBundle3
//
//  Created by Sona Hunanyan on 27.07.25.
//

import Foundation



class FamilyMemberRepository {
    static let instance = FamilyMemberRepository()
    
    func loadFamily() -> [FamilyMember]? {
        guard let url = Bundle.main.url(forResource: "simpsons_family", withExtension: "json") else {
            print("Family not found.")
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(FamilyResponse.self, from: data)
            return result.family
        } catch {
            print(error)
            return nil
        }
    }

}
