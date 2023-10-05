//
//  JourneyIcon.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import SwiftUI

struct JourneyIcon: View {
    var journey: FlightJourney

    var body: some View {
        Circle()
            .fill(.blue)
            .frame(width: 44, height: 44)
            .padding()
            .overlay {
                Image(systemName: journey.systemImage)
                    .foregroundStyle(.background)
            }
            .alignmentGuide(.flightLegArrow) { dimensions in
                dimensions[VerticalAlignment.center]
            }
    }
}

