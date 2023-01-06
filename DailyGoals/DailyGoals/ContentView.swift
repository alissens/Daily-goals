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
    
    var body: some View {
        VStack {
			List {
				Section(header: header, footer: footer) {
					ForEach($goals) { goal in
						row2(goal)
//						row(
//							ticketNumber: goal.ticketNumber,
//							description: goal.description,
//							goalAction: goal.goalAction,
//							assignedPerson: goal.assignedPerson
//						)
					}
				}
			}

			Spacer()

			HStack {
				Spacer()
				Button("Submit") {
					DailyGoalsGenerator.text(goals: goals)
					showCopySuccess = true
				}
				.padding()
				.alert("Text copied to clipboard", isPresented: $showCopySuccess, actions: {
					Button("OK") {}
				})
			}
        }
    }

	private var header: some View {
		ViewFormatter.date()
	}

	private var footer: some View {
		HStack {
			Spacer()
			ViewFormatter.plus {
				goals.append(Goal())
			}
		}
	}

	private func row2(_ goal: Binding<Goal>) -> some View {

		HStack {
			TextField("HSC", text: goal.ticketNumber)
			TextField("Description", text: goal.description)
			Picker("Action", selection: goal.goalAction) {
				Text("-").tag("")
				ForEach(GoalActions.actions, id: \.self) {
					Text($0)
				}
			}
			Picker("Assignee", selection: goal.assignedPerson) {
				Text("-").tag("")
				ForEach(Team.teamMembers) {
					Text($0.name)
				}
			}
		}
	}
    
    private func row(
        ticketNumber: Binding<String>,
        description: Binding<String>,
		goalAction: Binding<String>,
		assignedPerson: Binding<String>
	) -> some View {

			HStack {
				ViewFormatter.textInput(itemLabel: "HSC-", item: ticketNumber)
				ViewFormatter.textInput(itemLabel: "Description", item: description)

				ViewFormatter.picker(
					label: "Action",
					selectedItem: goalAction,
					group: GoalActions.actions)

				ViewFormatter.picker(
					label: "Assignee",
					selectedItem: assignedPerson,
					group: Array(Team.members.keys))
			}
		}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
