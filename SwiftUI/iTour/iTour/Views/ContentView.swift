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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(self.destinations) { destination in
                    VStack(alignment: .leading) {
                        Text(destination.name)
                            .font(.headline)
                        
                        Text(destination.date.formatted(date: .long, time: .shortened))
                    }
                }
            }
            .navigationTitle("iTour")
            .toolbar {
                Button("Add Samples", action: self.addSamples)
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
}

//#Preview {
//    ContentView()
//}
