//
//  NavBarItems.swift
//  EpamFinal
//
//  Created by Sona Hunanyan on 07.09.25.
//


enum NavBarItems: CaseIterable, Identifiable {
    var id: Int {
        self.hashValue
    }
    
    case cities
    case favorites
    case profile
}
