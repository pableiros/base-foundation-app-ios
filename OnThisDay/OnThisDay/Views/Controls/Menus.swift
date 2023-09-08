//
//  Menus.swift
//  OnThisDay
//
//  Created by pablo borquez on 24/08/23.
//

import SwiftUI

struct Menus: Commands {
    @AppStorage("displayMode") var displayMode = DisplayMode.auto
    @AppStorage("showTotals") var showTotals = true
    
    var body: some Commands {
        SidebarCommands()
        
        ToolbarCommands()
        
        CommandGroup(replacing: .help) {
            Button {
                self.showApiWebsite()
            } label: {
                Text("Zenquotes.io website")
            }
            .keyboardShortcut("ñ", modifiers: .command)
        }
        
        CommandMenu("Display") {
            Toggle(isOn: self.$showTotals) {
                Text("Show Totals")
            }
            .keyboardShortcut("t", modifiers: [.command, .shift, .option])
            
            Divider()
            
            Picker("Appearance", selection: self.$displayMode) {
                ForEach(DisplayMode.allCases, id: \.self) {
                    Text($0.rawValue).tag($0)
                }
            }
        }
    }
    
    func showApiWebsite() {
        let address = "https://today.zenquotes.io"
        
        guard let url = URL(string: address) else {
            fatalError()
        }
        
        NSWorkspace.shared.open(url)
    }
}
