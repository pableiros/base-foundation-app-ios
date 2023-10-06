//
//  BookingFormView.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import SwiftUI

struct BookingFormView: View {
    @Environment(\.calendar) private var calendar
    @Environment(\.dismiss) private var dismiss
    
    var flightModel: FlightModel
  
    @StateObject private var airportModel = AirportModel()
    @State private var inputData = BookingFormInputData()
    
    var airports: [Airport] {
        self.airportModel.airports
    }
    
    var isSaveDisabled: Bool {
        self.inputData.destination == nil
    }
    
    var body: some View {
        NavigationStack {
            BookingForm(airports: self.airports, inputData: $inputData)
                .navigationTitle("Add Your flight")
                .task {
                    Task.detached { @MainActor in
                        await airportModel.load()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            Task {
                                await self.save()
                            }
                        }
                        .disabled(isSaveDisabled)
                    }
                }
        }
    }
    
    func save() async {
        await self.inputData.save(to: flightModel, in: calendar)
        self.dismiss()
    }
}

#Preview {
    BookingFormView(flightModel: FlightModel(itinerary: [.sfoToMiaToPmi]))
}
