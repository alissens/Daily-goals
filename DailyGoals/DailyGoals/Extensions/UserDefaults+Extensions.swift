//
//  UserDefaults+Extensions.swift
//  DailyGoals
//
//  Created by Marcello Mascia on 11/02/2023.
//

import Foundation

extension UserDefaults {

	var jiraURLString: String {
		string(forKey: .jiraURLKey) ?? .defaultJiraURLValue
	}
	var ticketPrefix: String {
		string(forKey: .ticketPrefixKey) ?? .defaultTicketPrefixValue
	}
	var squadHandle: String {
		string(forKey: .squadHandleKey) ?? .defaultSquadHandleValue
	}
}
