//
//  DateFormatter.swift
//  DailyGoals
//
//  Created by Alisa Bagrova on 05/01/2023.
//

import SwiftUI

extension DateFormatter {
    
    public static func formattedDate() -> String {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        let numberFormatter = NumberFormatter()
        let date = Date()
        
        dateFormatter.dateFormat = "MMMM yyyy"
        dateFormatter.locale = Locale.current
        numberFormatter.numberStyle = .ordinal
        
        let formattedDay = numberFormatter.string(from: calendar.component(.day, from: date) as NSNumber) ?? ""
        let formattedMonthAndYear = dateFormatter.string(from: date)
        
        return "\(formattedDay) \(formattedMonthAndYear)"
    }
}
