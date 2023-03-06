//
//  String+Extensions.swift
//  DailyGoals
//
//  Created by Marcello Mascia on 20/01/2023.
//

import Foundation

extension String {

	static let ticketPrefixKey = "ticketPrefix"
	static let defaultTicketPrefixValue = "HSC-"

	static let jiraURLKey = "jiraURL"
	static let defaultJiraURLValue = "https://hudl-jira.atlassian.net"

	static let teamMembersKey = "teamMembers"

	static let squadHandleKey = "squadHandle"
	static let defaultSquadHandleValue = "@squid"
}

extension String {

	var removingTicketPrefix: String {
		let prefix = UserDefaults.standard.ticketPrefix
		if lowercased().hasPrefix(prefix.lowercased()) {
			return String(dropFirst(prefix.count))
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
