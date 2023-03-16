//
//  MembersPopover.swift
//  DailyGoals
//
//  Created by Marcello Mascia on 19/01/2023.
//

import SwiftUI

struct MembersPopover: View {

    @Binding var goal: Goal
    var teamMembers: [TeamMember] = TeamMember.squid

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ForEach(teamMembers) { member in
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
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
    }
}

struct MembersPopover_Previews: PreviewProvider {
    static var previews: some View {
        MembersPopover(goal: .constant(.init()))
    }
}
