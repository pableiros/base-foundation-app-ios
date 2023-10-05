//
//  BookingFormView.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import SwiftUI

struct BookingFormView: View {
    @StateObject private var airportModel = AirportModel()
    
    var body: some View {
        Text("Booking form view")
            .task {
                Task.detached { @MainActor in
                    await self.airportModel.load()
                }
            }
    }
}

#Preview {
    BookingFormView()
}
