//
//  Toolbar.swift
//  OnThisDay
//
//  Created by pablo borquez on 28/08/23.
//

import SwiftUI

struct Toolbar: CustomizableToolbarContent {
    @Binding var viewMode: ViewMode
    
    var body: some CustomizableToolbarContent {
        ToolbarItem(id: "toggleSidebar", placement: .navigation, showsByDefault: true) {
            Button {
                self.toggleSidebar()
            } label: {
                Image(systemName: "sidebar.left")
            }
            .help("Toggle Sidebar")
        }
        
        ToolbarItem(id: "viewMode") {
            Picker("View Mode", selection: self.$viewMode) {
                Label("Grid", systemImage: "square.grid.3x2")
                    .tag(ViewMode.grid)
                
                Label("Table", systemImage: "tablecells")
                    .tag(ViewMode.table)
            }
            .pickerStyle(.segmented)
            .help("Switch between Grid and Table")
        }
    }
    
    func toggleSidebar() {
        NSApp.keyWindow?
            .contentViewController?
            .tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}
