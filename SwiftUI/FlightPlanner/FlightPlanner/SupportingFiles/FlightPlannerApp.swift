//
//  FlightPlannerApp.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import SwiftUI

@main
struct FlightPlannerApp: App {
    var body: some Scene {
        WindowGroup {
            BookingFormView(flightModel: FlightModel(itinerary: [.sfoToMiaToPmi]))
        }
    }
}
