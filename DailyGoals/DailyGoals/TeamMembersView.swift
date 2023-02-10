//
//  TeamMembersView.swift
//  DailyGoals
//
//  Created by Marcello Mascia on 10/02/2023.
//

import SwiftUI

private extension TeamMember {

	static let squid: [TeamMember] = [
		.init(name: "Alisa", handle: "@Alisa Bagrova"),
		.init(name: "Bruno", handle: "@Bruno Gondim Bilescky"),
		.init(name: "Marcello", handle: "@marcello"),
		.init(name: "Pluddy", handle: "@pluddy"),
		.init(name: "Ian", handle: "@ianr"),
		.init(name: "Sonali", handle: "@sonalijot")
	]
}

struct TeamMembersView: View {

	@AppStorage("teamMembers") private var teamMembers: [TeamMember] = []
	@State private var shouldShowNewMemberDialog = false

	var body: some View {
		List {
			Section {
				ForEach(teamMembers) { member in
					VStack(alignment: .leading) {
						Text(member.name)
						Text(member.handle)
							.font(.footnote)
							.foregroundColor(.secondary)
					}
					.swipeActions {
						Button(role: .destructive) {
							if let index = teamMembers.firstIndex(of: member) {
								teamMembers.remove(at: index)
							}
						} label: {
							Label("Delete", systemImage: "trash")
						}
					}
				}
			}
		}
		.listStyle(.bordered(alternatesRowBackgrounds: true))
		.animation(.default, value: teamMembers.count)
		.sheet(isPresented: $shouldShowNewMemberDialog) {
			AddMemberView(shouldShow: $shouldShowNewMemberDialog) { name, handle in
				teamMembers.append(.init(name: name, handle: handle))
			}
			.frame(minWidth: 300)
		}
		.toolbar {
			Button("New") {
				shouldShowNewMemberDialog = true
			}
			.keyboardShortcut("N", modifiers: [.command])

			if teamMembers.isEmpty {
				Button("Squid") {
					TeamMember.squid.forEach { member in
						teamMembers.append(member)
					}
				}
			}
		}
    }
}

struct TeamMembersView_Previews: PreviewProvider {
    static var previews: some View {
        TeamMembersView()
    }
}
