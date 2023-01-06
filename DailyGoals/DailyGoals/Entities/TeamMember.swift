//
//  TeamMember.swift
//  DailyGoals
//
//  Created by Marcello Mascia on 06/01/2023.
//

import Foundation

struct TeamMember: Identifiable, Hashable {

	let id = UUID()
	let name: String
	let handle: String
}

extension TeamMember: CustomStringConvertible {

	var description: String { name }
}
