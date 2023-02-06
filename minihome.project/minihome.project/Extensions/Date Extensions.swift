//
//  DateFormatter.swift
//  minihome.project
//
//  Created by vladut on 2/6/23.
//

import Foundation

extension Date {
    var dayMonthYearString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd yyyy"
        return dateFormatter.string(from : self)
    }
}
