//
//  RecentSearchStore.swift
//  Storage3
//
//  Created by Sona Hunanyan on 28.07.25.
//

import Foundation

class RecentSearchStore {
    static let instance = RecentSearchStore()
    
    func get() -> [String] {
        let list = UserDefaults.standard.array(forKey: StoreKeys.search) as? [String]
        return list ?? []
    }
    
    func store(_ data: [String]) {
        UserDefaults.standard.set(data, forKey: StoreKeys.search)
    }
}
