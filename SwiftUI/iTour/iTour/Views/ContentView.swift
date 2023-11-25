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
    
    @Query var destinations: [Destination]
    
    @State private var path = [Destination]()
    
    var body: some View {
        NavigationStack(path: self.$path) {
            List {
                ForEach(self.destinations) { destination in
                    NavigationLink(value: destination) {
                        VStack(alignment: .leading) {
                            Text(destination.name)
                                .font(.headline)
                            
                            Text(destination.date.formatted(date: .long, time: .shortened))
                        }
                    }
                }
                .onDelete(perform: self.deleteDestinations(_:))
            }
            .navigationTitle("iTour")
            .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
            .toolbar {
                Button("Add Samples", action: self.addSamples)
                Button("Add Destination", systemImage: "plus", action: self.addDestination)
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
    
    private func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = self.destinations[index]
            self.modelContext.delete(destination)
        }
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
