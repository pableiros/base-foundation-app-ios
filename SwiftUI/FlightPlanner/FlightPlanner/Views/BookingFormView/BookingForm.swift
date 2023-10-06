//
//  BookingForm.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import SwiftUI

struct BookingForm: View {
    var airports: [Airport]
    @Binding var inputData: BookingFormInputData
    @Environment(\.calendar) private var calendar
    @State private var activeAirportPickerRole: AirportPicker.Role?
    
    var body: some View {
        Form {
            JourneyPicker(selection: $inputData.journey)
                .padding(.bottom)
            BookingFormAirportDetails(airports: airports,
                                      inputData: inputData,
                                      activePickerRole: $activeAirportPickerRole)
            
        }
        .labelsHidden()
        .sheet(item: $activeAirportPickerRole) { role in
            AirportPicker(airports: airports,
                          role: $activeAirportPickerRole,
                          inputData: $inputData)
        }
    }
}

#Preview {
    let airports = [Airport.sfo, .mia, .pmi]
    let inputData = BookingFormInputData()
    
    return BookingForm(airports: airports, inputData: .constant(inputData))
}
