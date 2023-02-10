//
//  TeamMember.swift
//  DailyGoals
//
//  Created by Marcello Mascia on 06/01/2023.
//

import Foundation

struct TeamMember: Identifiable, Hashable, Codable {

	let id: UUID
	let name: String
	let handle: String
}

extension TeamMember {

	init(name: String, handle: String) {
		self.init(id: .init(), name: name, handle: handle)
	}
}
