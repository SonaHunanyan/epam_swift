//
//  DateExtension.swift
//  TableView
//
//  Created by Sona Hunanyan on 02.07.25.
//

import Foundation

extension String {
    func toPrimaryFormat() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let formattedDate = dateFormatter.date(from: self)
        return formattedDate ?? Date.now
    }
}
