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
			return "👤"
		} else {
			return goal.members.map { $0.name }.joined(separator: ", ")
		}
	}

    var body: some View {
        HStack {
            Button {
                shouldShowPopover.toggle()
            } label: {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
            .popover(isPresented: $shouldShowPopover) {
                MembersPopover(goal: $goal)
            }
            Text(title)
                .onTapGesture {
                    shouldShowPopover.toggle()
                }
        }
    }
}

struct MembersSelectorView_Previews: PreviewProvider {

	static var previews: some View {
        VStack(alignment: .leading) {
            MembersSelectorView(goal: .constant(.init(members: [.init(name: "Pippo", handle: "@pippo")])))
            Divider()
            MembersPopover(goal: .constant(.init()))
        }
        .padding()
        .frame(width: 200)
    }
}
