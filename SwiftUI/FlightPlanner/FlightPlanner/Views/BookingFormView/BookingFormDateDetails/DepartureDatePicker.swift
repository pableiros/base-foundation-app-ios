//
//  DepartureDatePicker.swift
//  FlightPlanner
//
//  Created by pablo borquez on 11/10/23.
//

import SwiftUI

struct DepartureDatePicker: View {
    @Environment(\.calendar) private var calendar
    
    @Binding var selection: Date
    
    var journey: FlightJourney
    
    var range: ClosedRange<Date> {
        .now...self.max
    }
    
    var max: Date {
        let dateComponents = DateComponents(month: 6)
        let max = self.calendar.date(byAdding: dateComponents, to: .now)
        
        return max ?? .now
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Departure")
                .font(.caption)
            if self.journey == .oneWay {
                self.datePicker.datePickerStyle(.graphical)
            } else {
                self.datePicker
            }
        }
    }
    
    var datePicker: some View {
        DatePicker(selection: self.$selection,
                   in: self.range,
                   displayedComponents: .date) {
            Label("Departure date", systemImage: "calendar")
        }
    }
}

extension DepartureDatePicker {
    @MainActor
    init(inputData: Binding<BookingFormInputData>) {
        self.init(selection: inputData.departureDate,
                  journey: inputData.wrappedValue.journey)
    }
}
