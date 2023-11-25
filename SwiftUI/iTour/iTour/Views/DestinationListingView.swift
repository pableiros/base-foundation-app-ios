//
//  DestinationListingView.swift
//  iTour
//
//  Created by pablo borquez on 25/11/23.
//

import SwiftUI
import SwiftData

struct DestinationListingView: View {
    @Environment(\.modelContext) var modelContext

    @Query var destinations: [Destination]

    init(sort: SortDescriptor<Destination>, searchText: String) {
        self._destinations = Query(filter: #Predicate { destination in            
            return searchText.isEmpty ? true : destination.name.localizedStandardContains(searchText)
        }, sort: [sort])
    }
    
    var body: some View {
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
    }
    
    // MARK: - private
    
    private func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = self.destinations[index]
            self.modelContext.delete(destination)
        }
    }
}
