//
//  ContentView.swift
//  OnThisDay
//
//  Created by pablo borquez on 22/08/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    
    @SceneStorage("selectedDate") var selectedDate: String?
    @SceneStorage("eventType") var eventType: EventType?
    @SceneStorage("searchText") var searchText = ""
    @SceneStorage("viewMode") var viewMode = ViewMode.grid
    
    var events: [Event] {
        return self.appState.dataFor(eventType: self.eventType,
                                     date: self.selectedDate,
                                     searchText: self.searchText)
    }
    
    var windowTitle: String {
        var windowTitle = "On This Day"
        
        if let eventType {
            windowTitle = "\(windowTitle) - \(eventType.rawValue)"
        }
        
        return windowTitle
    }
    
    var body: some View {
        NavigationView {
            SidebarView(selection: self.$eventType)
            
            if self.viewMode == .grid {
                GridView(gridData: self.events)
            } else {
                TableView(tableData: self.events)
            }
        }
        .frame(minWidth: 700,
               idealWidth: 1000,
               maxWidth: .infinity,
               minHeight: 400,
               idealHeight: 800,
               maxHeight: .infinity)
        .navigationTitle(self.windowTitle)
        .toolbar(id: "mainToolbar") {
            Toolbar(viewMode: self.$viewMode)
        }
        .searchable(text: self.$searchText)
        .onAppear {
            if self.eventType == nil {
                self.eventType = .events
            }
        }
    }
}
