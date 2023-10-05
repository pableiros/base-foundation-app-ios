//
//  DestinationAirportButton.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import SwiftUI

struct DestinationAirportButton: View {
    var destination: Airport?
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            VStack(alignment: .trailing) {
                Text("Destination")
                    .font(.caption)
                Text(self.destination?.code ?? "Where to?")
                    .font(self.destination != nil ? .title : nil)
                    .fontWeight(self.destination != nil ? .bold : nil)
                    .foregroundStyle(self.destination != nil ? .primary : .secondary)
            }
        }
        .buttonStyle(.plain)
    }
}
