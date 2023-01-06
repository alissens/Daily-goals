//
//  Team.swift
//  DailyGoals
//
//  Created by Alisa Bagrova on 12/12/2022.
//

import Foundation

struct TeamMember: Identifiable, Hashable {
	let id = UUID()
	let name: String
	let handle: String
}

internal struct Team {
    
    static let members = ["Alisa" : "@Alisa Bagrova",
                          "Bruno" : "@bruno Gondim Bilescky",
                          "Marcello" : "@marcello",
                          "Pluddy" : "@pluddy",
                          "Ian" : "@ianr",
                          "Sonali" : "@sonalijot"]

	static let teamMembers: [TeamMember] = [
		.init(name: "Marcello", handle: "@marcello"),
		.init(name: "Alisa", handle: "@Alisa Bagrova")
	]
}
