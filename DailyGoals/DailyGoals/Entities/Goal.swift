//
//  Goal.swift
//  DailyGoals
//
//  Created by Alisa Bagrova on 05/01/2023.
//

import Foundation

struct Goal: Identifiable {

	let id = UUID()
    var ticketNumber: String = ""
    var description: String = ""
    var goalAction: String?
    var members: Set<TeamMember> = []
}
