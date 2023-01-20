//
//  String+Extensions.swift
//  DailyGoals
//
//  Created by Marcello Mascia on 20/01/2023.
//

import Foundation

extension String {

    static let ticketPrefix = "HSC-"

    var removingTicketPrefix: String {
        if lowercased().hasPrefix(.ticketPrefix.lowercased()) {
            return String(dropFirst(String.ticketPrefix.count))
        }
        return self
    }
}
