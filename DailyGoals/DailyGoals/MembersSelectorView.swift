//
//  MembersSelectorView.swift
//  DailyGoals
//
//  Created by Marcello Mascia on 07/01/2023.
//

import SwiftUI

struct MembersSelectorView: View {

	@Binding var goal: Goal
	@State private var shouldShowPopover = false

	var title: String {
		if goal.members.isEmpty {
			return "Assignee"
		} else {
			return goal.members.map { $0.name }.joined(separator: ", ")
		}
	}

    var body: some View {
		Button(title) {
			shouldShowPopover.toggle()
		}
		.popover(isPresented: $shouldShowPopover, arrowEdge: .trailing) {
			MembersPopover(goal: $goal)
		}
    }
}

struct MembersPopover: View {

	@Binding var goal: Goal

	var body: some View {
		VStack(alignment: .leading, spacing: 5) {
			ForEach(TeamMember.all) { member in
				let isSelected = goal.members.contains(member)

				Button {
					if isSelected {
						goal.members.remove(member)
					} else {
						goal.members.insert(member)
					}
				} label: {
					Label {
						Text(member.name)
					} icon: {
						Image(systemName: isSelected ? "checkmark.square.fill" : "square")
							.foregroundColor(isSelected ? .green : nil)
					}
				}
				.buttonStyle(.plain)
			}
		}
		.padding()
	}
}

struct MembersSelectorView_Previews: PreviewProvider {
    static var previews: some View {
		MembersSelectorView(goal: .constant(.init()))
		MembersPopover(goal: .constant(.init(members: [TeamMember.all.first!])))
    }
}
