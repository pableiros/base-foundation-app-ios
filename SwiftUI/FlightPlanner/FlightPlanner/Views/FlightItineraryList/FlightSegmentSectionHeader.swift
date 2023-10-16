//
//  FlightSegmentSectionHeader.swift
//  FlightPlanner
//
//  Created by pablo borquez on 16/10/23.
//

import SwiftUI

struct FlightSegmentSectionHeader: View {
    @Environment(\.calendar) private var calendar
    
    var segment: FlightSegment
    
    var hasSameDayFlights: Bool {
        self.calendar.isDate(self.departure, inSameDayAs: self.arrival)
    }
    
    var flightDate: LocalizedStringKey {
        "\(self.departure, style: .date)"
    }
    
    var flightDateRange: LocalizedStringKey {
        "\(self.departure, style: .date) – \(self.arrival, style: .date)"
    }

    var departure: Date {
        self.segment.departure
    }
    
    var arrival: Date {
        self.segment.arrival
    }
    
    var body: some View {
        Text(self.hasSameDayFlights ? self.flightDate : self.flightDateRange)
            .font(.headline)
            .textCase(.none)
    }
}

#Preview {
    FlightSegmentSectionHeader(segment: .sfoToMiaToPmi)
}
