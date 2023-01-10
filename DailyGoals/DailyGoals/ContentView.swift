//
//  ContentView.swift
//  DailyGoals
//
//  Created by Alisa Bagrova on 12/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var goals = [Goal()]
    @State private var showCopySuccess = false

	private let columns: [GridItem] = [
		GridItem(.fixed(90)),
		GridItem(.flexible(minimum: 100)),
		GridItem(.flexible(minimum: 100)),
		GridItem(.flexible(minimum: 100))
	]

    var body: some View {
		VStack(spacing: 0) {
			List {
				Section(header: sectionHeader) {
					ForEach($goals) {
						row(for: $0)
					}
				}
			}
			.animation(.default, value: goals.count)

			footer
        }
		.navigationTitle("Daily Goals")
		.navigationSubtitle(DateFormatter.formattedDate())
		.toolbar {
			ToolbarItem {
				ViewFormatter.plus {
					goals.append(Goal())
				}
				.keyboardShortcut("N", modifiers: [.command])
			}
		}
    }

	@ViewBuilder
	private var sectionHeader: some View {
		LazyVGrid(columns: columns, alignment: .leading) {
			Text("Ticket #")
			Text("Description")
			Text("Goal action")
			Text("Assignee")
		}
	}

	private var footer: some View {
		HStack {
			Spacer()

			Button {
				DailyGoalsGenerator.text(goals: goals)
				showCopySuccess = true
			} label: {
				Label("Copy to clipboard", systemImage: "doc.on.clipboard")
			}
			.padding()
            .alert("You're good", isPresented: $showCopySuccess) {}
		}
	}

	private func row(for goal: Binding<Goal>) -> some View {

		LazyVGrid(columns: columns, alignment: .leading) {
			ViewFormatter.textInput(item: goal.ticketNumber)
			ViewFormatter.textInput(item: goal.description)
			ViewFormatter.picker(selectedItem: goal.goalAction, items: GoalActions.actions)
			MembersSelectorView(goal: goal)
		}
		.padding(.vertical, 5)
		.swipeActions {
			Button(role: .destructive) {
				goals.removeAll(where: { $0.id == goal.id })
			} label: {
				Label("Delete", systemImage: "trash")
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
