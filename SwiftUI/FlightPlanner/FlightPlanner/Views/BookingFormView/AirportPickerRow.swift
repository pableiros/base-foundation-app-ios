//
//  AirportPickerRow.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import SwiftUI

struct AirportPickerRow: View {
    var airport: Airport
    
    var body: some View {
        Text(self.airport.city)
            .bold() +
        Text(" ") +
        Text("(\(self.airport.code))")
    }
}
