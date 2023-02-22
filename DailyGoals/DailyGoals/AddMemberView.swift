//
//  AddMemberView.swift
//  DailyGoals
//
//  Created by Marcello Mascia on 10/02/2023.
//

import SwiftUI

struct AddMemberView: View {

	@Binding var shouldShow: Bool
	let onSave: (_ name: String, _ handle: String) -> Void

	@State private var name = ""
	@State private var handle = ""

	var body: some View {
		Form {
			Section(header: Text("Add new team member")) {
				TextField("Name", text: $name)
				TextField("Handle", text: $handle)

				HStack {
					Button("Cancel", action: dismiss)
					Spacer()
					Button("Save", action: save)
				}
			}
		}
		.onSubmit(save)
		.padding()
	}

	private func save() {

		if name.isEmpty == false, handle.isEmpty == false {
			onSave(name, handle)
		}

		dismiss()
	}

	private func dismiss() {

		shouldShow = false
	}
}

struct AddMemberView_Previews: PreviewProvider {

	static var previews: some View {
		AddMemberView(shouldShow: .constant(true), onSave: { _, _ in })
	}
}
