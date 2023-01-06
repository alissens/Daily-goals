//
//  ViewFormatter.swift
//  DailyGoals
//
//  Created by Alisa Bagrova on 05/01/2023.
//

import SwiftUI

struct ViewFormatter {
    
    static func date() -> some View {
        
        Text("Date: \(DateFormatter.formattedDate())")
            .frame(alignment: .center)
            .padding(.vertical, 15)
    }
    
    static func textInput(itemLabel: String, item: Binding<String>) -> some View {
        
		TextField(itemLabel, text: item)
			.padding(.horizontal, 15)
			.padding(.vertical, 10)
			.frame(minWidth: 250)
    }
    
    static func picker(label: String, selectedItem: Binding<String>, group: [String]) -> some View {

		Picker(label, selection: selectedItem) {
			Text("-").tag("")
			ForEach(group, id: \.self) {
				Text($0)
			}
		}
		.padding(.horizontal, 15)
		.frame(minWidth: 250)
	}
    
    static func plus(action: @escaping () -> Void) -> some View {

		Button(
			action: action,
			label: {
				Image(systemName: "plus")
					.padding(5)
					.background(.gray)
					.clipShape(Circle())
			}
		)
		.buttonStyle(.plain)
    }
}
