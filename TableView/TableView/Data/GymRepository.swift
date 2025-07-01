//
//  GymRepository.swift
//  TableView
//
//  Created by Sona Hunanyan on 02.07.25.
//

import Foundation

class GymRepository {
    static func getClasses() -> [GymClass] {
        return [   GymClass(id: UUID().uuidString, name: "Stretching", day: "12 Jun 2025".toPrimaryFormat(), time: "12:00", duration: "2h", trainer: Trainer(fullName: "John Smith", photo: "trainer1") , isRegistered: false,),
                   GymClass(id: UUID().uuidString, name: "Karate", day: "13 Jun 2025".toPrimaryFormat(), time: "12:00", duration: "1h", trainer: Trainer(fullName: "Chuck Norris", photo: "trainer2") , isRegistered: true,),
                   GymClass(id: UUID().uuidString, name: "Pilates", day: "14 Jun 2025".toPrimaryFormat(), time: "14:00", duration: "15m", trainer: Trainer(fullName: "Homer Simpson", photo: "trainer3") , isRegistered: true,),
                   
                   GymClass(id: UUID().uuidString, name: "Fencing", day: "14 Jun 2025".toPrimaryFormat(), time: "13:00", duration: "45m", trainer: Trainer(fullName: "D'Artagnan", photo: "trainer4") , isRegistered: true,),
                   
                   GymClass(id: UUID().uuidString, name: "Yoga", day: "16 Jun 2025".toPrimaryFormat(), time: "13:00", duration: "30m", trainer: Trainer(fullName: "Lhamo Thondup", photo: "trainer5") , isRegistered: true,),

                   GymClass(id: UUID().uuidString, name: "Boxing", day: "16 Jun 2025".toPrimaryFormat(), time: "16:00", duration: "2h", trainer: Trainer(fullName: "Arthur Abraham", photo: "trainer6") , isRegistered: true,),
                   
                   GymClass(id: UUID().uuidString, name: "Stretching", day: "19 Jun 2025".toPrimaryFormat(), time: "16:00", duration: "2h", trainer: Trainer(fullName: "Abe Simpson", photo: "trainer7") , isRegistered: false,),
                   
                   
        ]
    }
}
