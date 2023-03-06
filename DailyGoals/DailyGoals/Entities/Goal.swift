//
//  Goal.swift
//  DailyGoals
//
//  Created by Alisa Bagrova on 05/01/2023.
//

import Foundation

struct Goal: Identifiable, Hashable {

	enum Action: CaseIterable, CustomStringConvertible {
		case unknown
		case devComplete
		case readyForQA
		case QAcomplete
		case done
		case additional

		var description: String {
			switch self {
			case .unknown:
				return ""
			case .devComplete:
				return "DEV complete"
			case .readyForQA:
				return "Ready for QA"
			case .QAcomplete:
				return "QA complete"
			case .done:
				return "Done"
			case .additional:
				return "Additional"
			}
		}
	}

	let id = UUID()
    var ticketNumber = ""
    var description = ""
    var action: Action = .unknown
    var members: Set<TeamMember> = []
}
