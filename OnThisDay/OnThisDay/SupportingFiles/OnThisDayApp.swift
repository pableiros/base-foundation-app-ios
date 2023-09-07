//
//  OnThisDayApp.swift
//  OnThisDay
//
//  Created by pablo borquez on 22/08/23.
//

import SwiftUI

@main
struct OnThisDayApp: App {
    @AppStorage("displayMode") var displayMode = DisplayMode.auto
    
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.appState)
                .onAppear {
                    DisplayMode.changedisplayMode(to: self.displayMode)
                }
                .onChange(of: self.displayMode) { newValue in
                    DisplayMode.changedisplayMode(to: newValue)
                }
        }
        .commands {
            Menus()
        }
        
        Settings {
            PreferencesView()
        }
    }
}
