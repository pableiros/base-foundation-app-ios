//
//  FlightLegRowHeader.swift
//  FlightPlanner
//
//  Created by pablo borquez on 16/10/23.
//

import SwiftUI

struct FlightLegRowHeader: View {
    var alignment: HorizontalAlignment
    var title: String
    var icon: Icon
    var airport: Airport
    var date: Date
    
    var dateFormat: Date.FormatStyle {
        Date.FormatStyle().weekday(.abbreviated).month(.abbreviated).day()
    }
    
    var timeZoneFormat: Date.FormatStyle {
        Date.FormatStyle().timeZone()
    }
    
    var body: some View {
        VStack(alignment: self.alignment, spacing: 4) {
            Label(self.title, systemImage: icon.rawValue)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .labelStyle(AlignmentLabelStyle(alignment: self.alignment))
            
            VStack(alignment: self.alignment) {
                Text(self.airport.code)
                    .font(.largeTitle)
                    .bold()
                
                Text(self.airport.city)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .offset(y: -2)
            }
            .alignmentGuide(.flightLegArrow) { dimensions in
                dimensions[VerticalAlignment.center]
            }
            
            Text(self.date, format: self.dateFormat)
                .fontWeight(.medium)

            Text(self.date, style: .time)
                .font(.callout)
                .fontWeight(.medium) +
            Text(" ") +
            Text(self.date, format: self.timeZoneFormat)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

extension FlightLegRowHeader {
    enum Icon: String {
        case arrival = "airplane.arrival"
        case calendar
        case departure = "airplane.departure"
        case mapPin = "mappin.and.ellipse"
    }
}

#Preview {
    Group {
        FlightLegRowHeader(
            alignment: .leading,
            title: "Departure",
            icon: .departure,
            airport: .sfo,
            date: .now)
        FlightLegRowHeader(
            alignment: .trailing,
            title: "Arrival",
            icon: .arrival,
            airport: .mia,
            date: .now.addingTimeInterval(60 * 60 * 6)) // +6 hours
    }
}
