//
//  ReturnDatePicker.swift
//  FlightPlanner
//
//  Created by pablo borquez on 06/10/23.
//

import SwiftUI

struct ReturnDatePicker: View {
    @Environment(\.calendar) private var calendar

    @Binding var selection: Date
    
    var departureDate: Date
    var journey: FlightJourney
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text("Return")
                .font(.caption)
            DatePicker(selection: $selection,
                       in: range,
                       displayedComponents: .date) {
                Label("Return date", systemImage: "calendar")
            }
        }
    }
    
    var range: ClosedRange<Date> {
        self.departureDate...self.max
    }
    
    var max: Date {
        let dateComponents = DateComponents(month: 6)
        let max = self.calendar.date(byAdding: dateComponents, to: self.departureDate)
        
        return max ?? .now
    }
}

extension ReturnDatePicker {
    @MainActor
    init(inputData: Binding<BookingFormInputData>) {
        self.init(selection: inputData.arrivalDate,
                  departureDate: inputData.wrappedValue.departureDate,
                  journey: inputData.wrappedValue.journey)
    }
}

