//
//  TableView.swift
//  OnThisDay
//
//  Created by pablo borquez on 28/08/23.
//

import SwiftUI

struct TableView: View {
    @State private var sortOrder = [KeyPathComparator(\Event.year)]
    @State private var selectedEventID: UUID?
    
    var tableData: [Event]
    var sortedTableData: [Event] {
        return self.tableData.sorted(using: self.sortOrder)
    }
    
    var selectedEvent: Event? {
        guard let selectedEventID = self.selectedEventID else { return nil }
        
        return self.tableData.first {
            $0.id == selectedEventID
        }
    }
    
    var body: some View {
        HStack {
            Table(self.sortedTableData,
                  selection: self.$selectedEventID,
                  sortOrder: self.$sortOrder) {
                TableColumn("Year", value: \.year) {
                    Text($0.year)
                }
                .width(min: 50, ideal: 60, max: 100)
                
                TableColumn("Title", value: \.text)
            }
            
            if let selectedEvent {
                EventView(event: selectedEvent)
                    .frame(width: 250)
            } else {
                Text("Select an event for more details…")
                    .font(.title3)
                    .padding()
                    .frame(width: 250)
            }
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView(tableData: [Event.sampleEvent])
    }
}
