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
    
    static func textInput(item: Binding<String>) -> some View {

		TextField("", text: item)
			.textFieldStyle(.squareBorder)
			.labelsHidden()
    }
    
	static func picker<Item>(selectedItem: Binding<Item>, items: [Item]) -> some View where Item: Hashable, Item: CustomStringConvertible {

		Picker("", selection: selectedItem) {
			ForEach(items, id: \.self) {
				Text($0.description).tag($0)
			}
		}
		.labelsHidden()
	}
    
    static func plus(action: @escaping () -> Void) -> some View {

		Button {
			action()
		} label: {
			Label("Add new row", systemImage: "plus.circle.fill")
		}
		.help("Add new row")
    }
}
