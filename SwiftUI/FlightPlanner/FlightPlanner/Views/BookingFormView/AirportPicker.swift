//
//  AirportPicker.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import SwiftUI

struct AirportPicker: View {
    enum Role: Int, CaseIterable, Identifiable {
        case origin
        case destination
        
        var id: Int { rawValue }
    }
    
    var airports: [Airport]
    @Binding var role: Role?
    @Binding var inputData: BookingFormInputData
    
    var body: some View {
        NavigationView {
            Group {
                if role == .origin {
                    self.originAirportList
                } else if role == .destination {
                    self.destinationAirportList
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        role = nil
                    }
                    .disabled(role == nil || role == .origin)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        role = nil
                    }
                    .disabled(isDoneDisabled)
                }
            }
        }
    }
    
    @MainActor
    var originAirportList: some View {
        List(selection: originSelection) {
            ForEach(self.airports, id: \.id) { airport in
                AirportPickerRow(airport: airport)
                    .tag(airport)
            }
        }
        .navigationTitle("Where from?")
    }
    
    @MainActor
    var originSelection: Binding<Airport?> {
        Binding<Airport?> {
            self.inputData.origin
        } set: { newValue in
            if let airport = newValue {
                self.inputData.origin = airport
            }
        }
    }
    
    @MainActor
    var destinationAirportList: some View {
        List(selection: self.$inputData.destination) {
            ForEach(self.destinationAirports) { airport in
                AirportPickerRow(airport: airport)
                    .tag(airport)
            }
        }
        .navigationTitle("Where to?")
    }
    
    @MainActor
    var destinationAirports: [Airport] {
        self.airports.filter { $0 != self.inputData.origin }
    }
    
    @MainActor
    var isDoneDisabled: Bool {
        self.role == nil || self.role == .destination && self.inputData.destination == nil
    }
}

struct AirportPicker_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(AirportPicker.Role.allCases) { role in
            AirportPicker(
                airports: [.sfo, .mia, .pmi],
                role: .constant(role),
                inputData: .constant(BookingFormInputData()))
        }
    }
}
