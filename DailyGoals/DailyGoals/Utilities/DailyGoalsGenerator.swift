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
        var text = "@squid *Daily Goats\(DateFormatter.formattedDate())* \(SquidEmojis.squids.randomElement()!)\n"
        
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
		var text = ":circle: [HSC-\(ticketNumber)](https://hudl-jira.atlassian.net/browse/HSC-\(ticketNumber))"

		if description.isEmpty == false {
			text += " - \(description)"
		}

		if let assignedPerson {
			text += " - \(assignedPerson.name)"
		}

		if let goalAction {
			text += " - \(goalAction)"
		}

		text += "\n"

		return text
	}
}
