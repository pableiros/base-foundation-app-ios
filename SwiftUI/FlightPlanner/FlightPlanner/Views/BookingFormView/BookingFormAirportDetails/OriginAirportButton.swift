//
//  OriginAirportButton.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import SwiftUI

struct OriginAirportButton: View {
    var origin: Airport
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading) {
                Text("Origin")
                    .font(.caption)
                Text(self.origin.code)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
        }
        .buttonStyle(.plain)
    }
}
