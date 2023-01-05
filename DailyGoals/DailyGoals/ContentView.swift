//
//  ContentView.swift
//  DailyGoals
//
//  Created by Alisa Bagrova on 12/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var goals = [Goal()]
    @State private var dailyGoalsText = ""
    @State private var showCopySuccess = false
    
    var body: some View {
        VStack {
            Form {
                VStack {
                    ViewFormatter.date()
                    HStack {
                        VStack {
                            ForEach(0 ..< goals.count, id: \.self) { index in

                                row(
                                    ticketNumber: $goals[index].ticketNumber,
                                    description: $goals[index].description,
                                    goalAction: $goals[index].goalAction,
                                    assignedPerson: $goals[index].assignedperson)
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
            .padding(.all, 10)
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
                    item: goalAction,
                    group: GoalActions.actions)
            }
            
            Section {
                ViewFormatter.picker(
                    label: "Assigned person",
                    item: assignedPerson,
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
