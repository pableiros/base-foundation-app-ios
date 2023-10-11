//
//  BookingFormDateDetails.swift
//  FlightPlanner
//
//  Created by pablo borquez on 11/10/23.
//

import SwiftUI

struct BookingFormDateDetails: View {
    @Binding var inputData: BookingFormInputData
    
    var body: some View {
        HStack {
            DepartureDatePicker(inputData: $inputData)
                .onChange(of: inputData.departureDate) { _, newValue in
                    if inputData.arrivalDate < newValue {
                        inputData.arrivalDate = newValue
                    }
                }
            if inputData.journey != .oneWay {
                Color.clear
                    .frame(maxWidth: 44, maxHeight: 44)
                    .padding()
                ReturnDatePicker(inputData: $inputData)
            }
        }
        .datePickerStyle(.compact)
        .padding(.vertical)
    }
}

#Preview {
    BookingFormDateDetails(inputData: .constant(BookingFormInputData()))
}
