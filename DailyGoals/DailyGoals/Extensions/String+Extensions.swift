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

	func matchingStrings(regex: String) -> [[String]] {

		guard let regex = try? NSRegularExpression(pattern: regex) else { return [] }

		let nsString = self as NSString
		let results  = regex.matches(in: self, range: NSRange(location: 0, length: nsString.length))

		return results.map { result in
			(0..<result.numberOfRanges).map { result.range(at: $0).location != NSNotFound
				? nsString.substring(with: result.range(at: $0))
				: ""
			}
		}
	}
}
