//
//  HeaderGridRow.swift
//  FlightPlanner
//
//  Created by pablo borquez on 20/10/23.
//

import SwiftUI

struct HeaderGridRow: View {
    var forecastInfo: [FlightForecastInfo]
    var headerColor: Color
    
    var body: some View {
        GridRow {
            if self.forecastInfo.contains(where: { $0.isHourlyForecast }) {
                Text("Time")
                Text("Cond")
                Text("Temp")
                Text("Precip")
                Text("Wind")
            } else {
                Text("Date")
                Text("Cond")
                Text("Low")
                Text("High")
                Text("Precip")
            }
        }
        .foregroundColor(self.headerColor)
        .font(.headline)
        .fontWeight(.medium)
        .padding(.bottom, 6)
        .textCase(.uppercase)
    }
}
