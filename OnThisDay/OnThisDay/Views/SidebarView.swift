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
    
    @SceneStorage("selectedDate") var selectedDate: String?
    
    @Binding var selection: EventType?
    
    var body: some View {
        VStack {
            List(selection: $selection) {
                Section(self.selectedDate?.uppercased() ?? "TODAY") {
                    ForEach(EventType.allCases, id: \.self) { eventType in
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
