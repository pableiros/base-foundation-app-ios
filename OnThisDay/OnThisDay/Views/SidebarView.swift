//
//  SidebarView.swift
//  OnThisDay
//
//  Created by pablo borquez on 23/08/23.
//

import SwiftUI

struct SidebarView: View {
    @EnvironmentObject var appState: AppState
    @AppStorage("showTotals") var showTotals = true
    
    @Binding var selection: EventType?
    
    var body: some View {
        List(selection: $selection) {
            Section("TODAY") {
                ForEach(EventType.allCases, id: \.self) { eventType in
                    Text(eventType.rawValue)
/*** BADGE --->** */      .badge(self.showTotals ? self.appState.countFor(eventType: eventType) : 0)
                }
            }
        }
        .listStyle(.sidebar)
    }
}
