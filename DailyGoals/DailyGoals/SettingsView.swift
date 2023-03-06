//
//  SettingsView.swift
//  DailyGoals
//
//  Created by Marcello Mascia on 09/02/2023.
//

import SwiftUI

struct SettingsView: View {

	@AppStorage(.ticketPrefixKey) private var ticketPrefix = .defaultTicketPrefixValue
	@AppStorage(.jiraURLKey) private var jiraURL = .defaultJiraURLValue
	@AppStorage(.squadHandleKey) private var squadHandle = .defaultSquadHandleValue

    var body: some View {
		Form {
			LabeledContent {
				TeamMembersView()
					.frame(maxHeight: 200)
			} label: {
				Text("Team")
			}
			TextField("Ticket prefix", text: $ticketPrefix)
			TextField("Jira url", text: $jiraURL)
			TextField("Squad handle", text: $squadHandle)
		}
		.padding()
    }
}

struct SettingsView_Previews: PreviewProvider {

	static var previews: some View {
		SettingsView()
    }
}
