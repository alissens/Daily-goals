//
//  TeamMembersView.swift
//  DailyGoals
//
//  Created by Marcello Mascia on 10/02/2023.
//

import SwiftUI

extension TeamMember {

	public static let squid: [TeamMember] = [
		.init(name: "Alisa", handle: "@Alisa Bagrova"),
		.init(name: "Bruno", handle: "@Bruno Gondim Bilescky"),
		.init(name: "Marcello", handle: "@marcello"),
		.init(name: "Pluddy", handle: "@pluddy"),
		.init(name: "Ian", handle: "@ianr"),
		.init(name: "Sonali", handle: "@sonalijot"),
        .init(name: "Stu", handle: "@stu")
	]
}

struct TeamMembersView: View {

	@AppStorage(.teamMembersKey) private var teamMembers: [TeamMember] = []
	@State private var shouldShowNewMemberDialog = false

	var body: some View {
		List($teamMembers, editActions: .all) { $member in
			HStack {
				Text(member.name)
				Text(member.handle)
					.foregroundColor(.secondary)
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
		.overlay(alignment: .topTrailing) {
			VStack(alignment: .trailing) {
				Button {
					shouldShowNewMemberDialog = true
				} label: {
					Image(systemName: "plus")
				}
				.keyboardShortcut("N", modifiers: [.command])

				if teamMembers.isEmpty {
					Button("🦑") {
						TeamMember.squid.forEach { member in
							teamMembers.append(member)
						}
					}
				}
			}
			.padding()
		}
    }
}

struct TeamMembersView_Previews: PreviewProvider {
    static var previews: some View {
        TeamMembersView()
    }
}
