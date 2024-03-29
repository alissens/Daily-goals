//
//  ContentView.swift
//  DailyGoals
//
//  Created by Alisa Bagrova on 12/12/2022.
//

import SwiftUI

struct ContentView: View {
    
	@State private var goals: [Goal] = []
    @State private var showCopySuccess = false
	@State private var isTargeted = false

	private let columns: [GridItem] = [
		GridItem(.fixed(90)),
		GridItem(.flexible(minimum: 250)),
		GridItem(.fixed(150)),
		GridItem(.flexible(minimum: 100))
	]

    var body: some View {
		VStack(spacing: 0) {
			List {
				Section(header: sectionHeader) {
					ForEach($goals, editActions: .all) {
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
					goals.append(.init())
				}
				.keyboardShortcut("N", modifiers: [.command])
			}
		}
		.border(.tint, width: isTargeted ? 3 : 0)
		.onDrop(of: [.url, .internetLocation], isTargeted: $isTargeted, perform: handleDrop)
    }

	@ViewBuilder
	private var sectionHeader: some View {
		LazyVGrid(columns: columns, alignment: .leading) {
			Text("Ticket number")
			Text("Description")
			Text("Goal")
			Text("Assigned person")
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
            .alert("Goals copied", isPresented: $showCopySuccess) {}
		}
	}

	private func row(for goal: Binding<Goal>) -> some View {

		LazyVGrid(columns: columns, alignment: .leading) {
			ViewFormatter.textInput(item: goal.ticketNumber)
			ViewFormatter.textInput(item: goal.description)
			ViewFormatter.picker(selectedItem: goal.action, items: Goal.Action.allCases)
			MembersSelectorView(goal: goal)
		}
		.padding(.vertical, 5)
	}

	private func handleDrop(with providers: [NSItemProvider]) -> Bool {

		providers.loadObjects { result in

			Task {
				do {
					let url = try result.get()
					goals.append(.init(ticketNumber: url.ticketNumber))
				} catch {
					print(error)
				}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
