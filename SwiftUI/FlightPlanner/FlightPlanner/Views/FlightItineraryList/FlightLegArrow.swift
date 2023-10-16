//
//  FlightLegArrow.swift
//  FlightPlanner
//
//  Created by pablo borquez on 16/10/23.
//

import SwiftUI

struct FlightLegArrow: View {
    var color: FlightSegment.Color

    var body: some View {
        Circle()
            .fill(Color(self.color))
            .frame(width: 44, height: 44)
            .overlay {
                Image(systemName: "arrow.right")
                    .font(.system(size: 24, weight: .medium, design: .rounded))
                    .foregroundColor(Color(.systemBackground))
                    .padding()
            }
            .alignmentGuide(.flightLegArrow) { dimensions in
                dimensions[VerticalAlignment.center]
            }
    }
}

#Preview {
    FlightLegArrow(color: .random)
}
