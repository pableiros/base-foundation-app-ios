//
//  ContentView.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.editMode) private var editMode
    
    @State private var selection: FlightLeg?
    @State private var showBookingForm = false
    
    @StateObject private var flightModel = FlightModel()
    
    var body: some View {
        NavigationSplitView {
            ZStack {
                Group {
                    if self.flightModel.segments.isEmpty {
                        Text("No Flights")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundStyle(.tertiary)
                    } else {
                        FlightItineraryList(selection: self.$selection,
                                            segments: self.$flightModel.segments,
                                            onDelete: self.onDelete)
                    }
                }
                .task {
                    Task.detached { @MainActor in
                        await self.flightModel.load()
                    }
                }
                .navigationTitle("My Flights")
                .sheet(isPresented: $showBookingForm) {
                    BookingFormView(flightModel: flightModel)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                            .disabled(flightModel.segments.isEmpty)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            self.showBookingForm.toggle()
                        } label: {
                            Label("Add Flight", systemImage: "square.and.pencil")
                        }
                    }
                }
            }
        } detail: {
            ZStack {
                // TODO: - Flight Leg Detail
            }
        }
    }
    
    func onDelete(atOffsets offsets: IndexSet, in segment: FlightSegment) {
        self.flightModel.removeLegs(atOffsets: offsets, in: segment)
    }
    
    var isAddFlightButtonDisabled: Bool {
        self.editMode?.wrappedValue.isEditing == true
    }
}

#Preview {
    ContentView()
}
