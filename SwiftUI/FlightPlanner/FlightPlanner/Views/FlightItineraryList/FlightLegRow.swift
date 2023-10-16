//
//  FlightLegRow.swift
//  FlightPlanner
//
//  Created by pablo borquez on 16/10/23.
//

import SwiftUI

struct FlightLegRow: View {
    var leg: FlightLeg
    var isSelected: Bool = false
    
    var fillStyle: some ShapeStyle {
        if self.isSelected {
            return AnyShapeStyle(.clear)
        } else {
            return AnyShapeStyle(.background)
        }
    }
    
    var body: some View {
        ZStack(alignment: .arrowBottom) {
            FlightLegRowFooter(alignment: .center, leg: self.leg)
                .alignmentGuide(.arrow) { dimensions in
                    dimensions[HorizontalAlignment.center]
                }
            VStack(spacing: 8) {
                HStack(alignment: .flightLegArrow) {
                    FlightLegRowHeader(alignment: .leading,
                                       title: "Departure",
                                       icon: .departure,
                                       airport: self.leg.origin,
                                       date: self.leg.departure)
                    Spacer()
                    FlightLegArrow(color: self.leg.color)
                    Spacer()
                    FlightLegRowHeader(alignment: .trailing,
                                       title: "Arrival",
                                       icon: .arrival,
                                       airport: self.leg.destination,
                                       date: self.leg.arrival)
                }
                HStack {
                    FlightLegRowFooter(alignment: .leading, leg: self.leg)
                    Spacer()
                    FlightLegRowFooter(alignment: .trailing, leg: self.leg)
                }
            }
        }
        .padding(8)
        .background {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(fillStyle)
        }
    }
}

#Preview {
    Group {
        FlightLegRow(leg: .sfoToMia, isSelected: false)
        FlightLegRow(leg: .sfoToMia, isSelected: true)
        FlightLegRow(leg: .miaToPmi, isSelected: false)
        FlightLegRow(leg: .miaToPmi, isSelected: true)
    }
}
