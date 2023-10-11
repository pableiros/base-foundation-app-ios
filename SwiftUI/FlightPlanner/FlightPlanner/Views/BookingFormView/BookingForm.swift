//
//  BookingForm.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import SwiftUI

struct BookingForm: View {
    @Environment(\.calendar) private var calendar
    
    var airports: [Airport]
    
    @Binding var inputData: BookingFormInputData
    
    @State private var activeAirportPickerRole: AirportPicker.Role?
    
    var body: some View {
        Form {
            JourneyPicker(selection: $inputData.journey)
                .padding(.bottom)
            BookingFormAirportDetails(airports: airports,
                                      inputData: inputData,
                                      activePickerRole: $activeAirportPickerRole)
            BookingFormDateDetails(inputData: $inputData)
            
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
