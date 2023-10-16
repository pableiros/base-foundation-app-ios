//
//  FlightItineraryList.swift
//  FlightPlanner
//
//  Created by pablo borquez on 16/10/23.
//

import SwiftUI

struct FlightItineraryList: View {
    @Binding var selection: FlightLeg?
    @Binding var segments: [FlightSegment]
    
    var onDelete: ((IndexSet, FlightSegment) -> Void)? = nil
    
    var body: some View {
        List(self.segments, selection: self.$selection) { segment in
            Section {
                FlightSegmentRow(
                    selection: $selection,
                    segment: segment) { offsets in
                    onDelete?(offsets, segment)
                }
            } header: {
                FlightSegmentSectionHeader(segment: segment)
            }
        }
    }
}

#Preview {
    Group {
        FlightItineraryList(selection: .constant(nil),
                            segments: .constant([.sfoToMia]))
        FlightItineraryList(selection: .constant(.sfoToMia),
                            segments: .constant([.sfoToMia]))
    }
}
