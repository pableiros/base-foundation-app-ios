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
    @AppStorage("showBirths") var showBirths = true
    @AppStorage("showDeaths") var showDeaths = true
    
    @SceneStorage("selectedDate") var selectedDate: String?
    
    @Binding var selection: EventType?
    
    var validTypes: [EventType] {
        var types = [EventType.events]
        
        if self.showBirths {
            types.append(.births)
        }
        
        if self.showDeaths {
            types.append(.deaths)
        }
        
        return types
    }
    
    var body: some View {
        VStack {
            List(selection: $selection) {
                Section(self.selectedDate?.uppercased() ?? "TODAY") {
                    ForEach(self.validTypes, id: \.self) { eventType in
                        Text(eventType.rawValue)
                            .badge(self.showTotals ? self.appState.countFor(eventType: eventType, date: self.selectedDate) : 0)
                    }
                }
                
                Section("AVAILABLE DATES") {
                    ForEach(self.appState.sortedDates, id: \.self) { date in
                        Button {
                            self.selectedDate = date
                        } label: {
                            HStack {
                                Text(date)
                                Spacer()
                            }
                        }
                        .controlSize(.large)
                        .modifier(DateButtonViewModifier(selected: self.selectedDate == date))
                    }
                }
            }
            .listStyle(.sidebar)
            
            Spacer()
            
            DayPicker()
        }
        .frame(minWidth: 220)
    }
}
