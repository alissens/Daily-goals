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
            Form {
                VStack {
                    ViewFormatter.date()
                    HStack {
                        VStack {
                            ForEach($goals) { goal in
								row(
									ticketNumber: goal.ticketNumber,
									description: goal.description,
									goalAction: goal.goalAction,
									assignedPerson: goal.assignedPerson
								)
                            }
                        }
                        
                        ViewFormatter.plus {
                            goals.append(Goal())
                        }
                    }
                }
            }
            Button("Submit") {
                DailyGoalsGenerator.text(goals: goals)
                showCopySuccess = true
            }
            .padding(10)
            .alert("Text copied to clipboard", isPresented: $showCopySuccess, actions: {
                Button("OK") {}
            })
        }
    }
    
    private func row(
        ticketNumber: Binding<String>,
        description: Binding<String>,
        goalAction: Binding<String>,
        assignedPerson: Binding<String>) -> some View {
        
        HStack {
            ViewFormatter.textInput(itemLabel: "HSC number", item: ticketNumber)
            ViewFormatter.textInput(itemLabel: "Ticket description", item: description)
            
            Section {
                ViewFormatter.picker(
                    label: "Action",
                    selectedItem: goalAction,
                    group: GoalActions.actions)
            }
            
            Section {
                ViewFormatter.picker(
                    label: "Assigned person",
                    selectedItem: assignedPerson,
                    group: Array(Team.members.keys))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
