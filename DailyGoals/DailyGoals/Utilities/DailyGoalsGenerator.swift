//
//  DailyGoalsGenerator.swift
//  DailyGoals
//
//  Created by Alisa Bagrova on 05/01/2023.
//

import SwiftUI

public struct DailyGoalsGenerator {
    
    public static func text(goals: [Goal]) {
        generate(goals)
    }
    
    private static func generate(_ goals: [Goal]){
        var text = "@squid *\(DateFormatter.formattedDate())* \(SquidEmojis.squids.randomElement()!)\n"
        
        for goal in goals {
            text += ":circle: [HSC-\(goal.ticketNumber)](https://hudl-jira.atlassian.net/browse/HSC-\(goal.ticketNumber)) - \(goal.description) - \(Team.members[goal.assignedperson] ?? "") - \(goal.goalAction)\n"
        }
        
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(text, forType: .string)
    }
}
