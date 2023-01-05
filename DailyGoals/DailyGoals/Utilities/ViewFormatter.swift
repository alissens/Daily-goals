//
//  ViewFormatter.swift
//  DailyGoals
//
//  Created by Alisa Bagrova on 05/01/2023.
//

import SwiftUI

public struct ViewFormatter {
    
    public static func date() -> some View {
        
        Text("Date: \(DateFormatter.formattedDate())")
            .frame(alignment: .center)
            .padding(.vertical, 15)
    }
    
    public static func textInput(itemLabel: String, item : Binding<String>) -> some View {
        
        TextField(
            itemLabel,
            text: item)
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .frame(width: 250)
    }
    
    public static func picker(label: String, item: Binding<String>, group: [String]) -> some View {
        
        Picker(
            label,
            selection: item) {
                ForEach(
                    group,
                    id: \.self) {
                        Text($0)
                        Divider()
                    }
            }
            .padding(.horizontal, 15)
            .frame(width: 250)
    }
    
    public static func plus(action: @escaping () -> Void) -> some View {
        
        Button(action: action, label: { Image(systemName: "plus")
                .padding(.all, 3)
                .background(Color.gray)
            .clipShape(Circle()) }
        ).clipShape(Circle())
    }
}
