//
//  GymClass.swift
//  TableView
//
//  Created by Sona Hunanyan on 01.07.25.
//

import Foundation


struct GymClass {
    let id: String
    let name: String
    let day: Date
    let time: String
    let duration: String
    let trainer: Trainer
    var isRegistered: Bool
}

struct Trainer {
    let fullName: String
    let photo: String
}
