//
//  DisplayMode.swift
//  OnThisDay
//
//  Created by pablo borquez on 28/08/23.
//

import SwiftUI

enum DisplayMode: String, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    case auto = "Auto"
    
    static func changedisplayMode(to displayMode: DisplayMode) {
        @AppStorage("displayMode") var displayModeStorage = DisplayMode.auto
        
        displayModeStorage = displayMode
        
        switch displayMode {
        case .light:
            NSApp.appearance = NSAppearance(named: .aqua)
        case .dark:
            NSApp.appearance = NSAppearance(named: .darkAqua)
        case .auto:
            NSApp.appearance = nil
        }
    }
}
