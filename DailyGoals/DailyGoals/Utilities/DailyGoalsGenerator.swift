//
//  DailyGoalsGenerator.swift
//  DailyGoals
//
//  Created by Alisa Bagrova on 05/01/2023.
//

import SwiftUI

struct DailyGoalsGenerator {
    
    static func text(goals: [Goal]) {

		generate(goals)
    }
    
    private static func generate(_ goals: [Goal]) {

		var text = "\(UserDefaults.standard.squadHandle) *Daily Goals \(DateFormatter.formattedDate())*"

		if let emoji = SquidEmojis.squids.randomElement() {
			text += " \(emoji)"
		}

		text += "\n"

        for goal in goals {
			text += goal.text
        }

        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(text, forType: .string)
    }
}

private extension Goal {

	var text: String {
		let prefix = UserDefaults.standard.ticketPrefix
		let url = UserDefaults.standard.jiraURLString
        let ticketNumber = ticketNumber.removingTicketPrefix

		if ticketNumber.isEmpty {
			return ""
		}

		var text = ":circle: [\(prefix)\(ticketNumber)](\(url)/browse/\(prefix)\(ticketNumber))"

		if description.isEmpty == false {
			text += " - \(description)"
		}

		if members.isEmpty == false {
			text += " - \(members.map{ $0.handle }.joined(separator: " "))"
		}

		switch action {
		case .additional:
			text += ""
		case .unknown:
			text += " - `???`"
		default:
			text += " - `\(action.description)`"
		}

		text += "\n"

		return text
	}
}
