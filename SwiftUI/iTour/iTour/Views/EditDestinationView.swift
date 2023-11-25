//
//  EditDestinationView.swift
//  iTour
//
//  Created by pablo borquez on 22/11/23.
//

import SwiftUI
import SwiftData

struct EditDestinationView: View {
    @Bindable var destination: Destination
    
    var body: some View {
        Form {
            TextField("Name", text: self.$destination.name)
            TextField("Details", text: self.$destination.details, axis: .vertical)
            DatePicker("Date", selection: self.$destination.date)
            
            Section("Priority") {
                Picker("Priority", selection: self.$destination.priority) {
                    Text("Meh").tag(1)
                    Text("Maybe").tag(2)
                    Text("Must").tag(3)
                }
                .pickerStyle(.segmented)
            }
        }
        .navigationTitle("Edit destination")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let modelConfiguration = ModelConfiguration(isStoredInMemoryOnly: true)
        _ = try ModelContainer(for: Destination.self,
                                                configurations: modelConfiguration)
        let destination = Destination(name: "Example Destination", details: "Example details go here and will automatically expand vertically as they are edited.")
        
        return NavigationStack {
            EditDestinationView(destination: destination)
        }
    } catch {
        fatalError("Failed to create model container")
    }
}
