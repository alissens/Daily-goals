//
//  DailyGoalsApp.swift
//  DailyGoals
//
//  Created by Alisa Bagrova on 12/12/2022.
//

import SwiftUI
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {

	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {

		true
	}
}

@main
struct DailyGoalsApp: App {

	@NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }

		Settings {
			SettingsView()
				.frame(minWidth: 400, minHeight: 400)
		}
    }
}
