//
//  FlightSegmentRow.swift
//  FlightPlanner
//
//  Created by pablo borquez on 16/10/23.
//

import SwiftUI

struct FlightSegmentRow: View {
    @Binding var selection: FlightLeg?
    
    var segment: FlightSegment
    var onDelete: ((IndexSet) -> Void)? = nil
    
    var body: some View {
        ForEach(self.segment.legs) { leg in
            NavigationLink(value: leg) {
                FlightLegRow(leg: leg,
                             isSelected: leg == self.selection)
            }
        }
        .onDelete(perform: self.onDelete)
    }
}

#Preview {
    Group {
        FlightSegmentRow(
            selection: .constant(nil),
            segment: .sfoToMiaToPmi)
        FlightSegmentRow(
            selection: .constant(.sfoToMia),
            segment: .sfoToMiaToPmi)
    }
}
