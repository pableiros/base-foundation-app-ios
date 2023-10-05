//
//  JourneyPicker.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import SwiftUI

struct JourneyPicker: View {
    @Binding var selection: FlightJourney
    
    private var data: [FlightJourney]
    
    init(_ data: [FlightJourney] = FlightJourney.allCases,
         selection: Binding<FlightJourney>) {
        self.data = data
        _selection = selection
    }
    
    var body: some View {
        Picker(selection: self.$selection) {
            ForEach(self.data) { journey in
                Text(journey.title)
                    .tag(journey)
            }
        } label: {
            Label("Journey", systemImage: self.selection.systemImage)
        }
        .pickerStyle(.segmented)
    }
}

#Preview {
    JourneyPicker(selection: .constant(.roundTrip))
}
