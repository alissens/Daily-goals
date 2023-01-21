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
        var text = "@squid *Daily Goals \(DateFormatter.formattedDate())* \(SquidEmojis.squids.randomElement()!)\n"
        
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
        let prefix = String.ticketPrefix
        let ticketNumber = ticketNumber.removingTicketPrefix

		if ticketNumber.isEmpty {
			return ""
		}

		var text = ":circle: [\(prefix)\(ticketNumber)](https://hudl-jira.atlassian.net/browse/\(prefix)\(ticketNumber))"

		if description.isEmpty == false {
			text += " - \(description)"
		}

		if members.isEmpty == false {
			text += " - \(members.map{ $0.handle }.joined(separator: " "))"
		}

		if let goalAction {
			text += " - \(goalAction)"
		}

		text += "\n"

		return text
	}
}
