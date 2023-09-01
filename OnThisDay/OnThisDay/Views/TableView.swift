//
//  TableView.swift
//  OnThisDay
//
//  Created by pablo borquez on 28/08/23.
//

import SwiftUI

struct TableView: View {
    @State private var sortOrder = [KeyPathComparator(\Event.year)]
    
    var tableData: [Event]
    var sortedTableData: [Event] {
        return self.tableData.sorted(using: self.sortOrder)
    }
    
    var body: some View {
        Table(self.sortedTableData, sortOrder: self.$sortOrder) {
            TableColumn("Year", value: \.year) {
                Text($0.year)
            }
            .width(min: 50, ideal: 60, max: 100)
            
            TableColumn("Title", value: \.text)
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView(tableData: [Event.sampleEvent])
    }
}
