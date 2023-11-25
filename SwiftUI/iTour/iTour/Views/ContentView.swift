//
//  ContentView.swift
//  iTour
//
//  Created by pablo borquez on 14/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var path = [Destination]()
    @State private var sortOrder = SortDescriptor(\Destination.name)
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: self.$path) {
            DestinationListingView(sort: self.sortOrder, searchText: self.searchText)
                .searchable(text: self.$searchText)
                .navigationTitle("iTour")
                .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
                .toolbar {
                    Button("Add Samples", action: self.addSamples)
                    Button("Add Destination", systemImage: "plus", action: self.addDestination)
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: self.$sortOrder) {
                            Text("Name")
                                .tag(SortDescriptor(\Destination.name))
                            
                            Text("Priority")
                                .tag(SortDescriptor(\Destination.priority, order: .reverse))
                            
                            Text("Date")
                                .tag(SortDescriptor(\Destination.date))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
    // MARK: - private
    
    private func addSamples() {
        let romeDestination = Destination(name: "Rome")
        let florenceDestination = Destination(name: "Florence")
        let naplesDestination = Destination(name: "Naples")
        
        self.modelContext.insert(romeDestination)
        self.modelContext.insert(florenceDestination)
        self.modelContext.insert(naplesDestination)
    }
    
    private func addDestination() {
        let destination = Destination()
        self.modelContext.insert(destination)
        
        self.path = [destination]
    }
}

//#Preview {
//    ContentView()
//}
