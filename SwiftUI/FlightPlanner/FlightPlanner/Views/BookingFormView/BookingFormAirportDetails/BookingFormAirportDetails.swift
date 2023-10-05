//
//  BookingFormAirportDetails.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import SwiftUI

struct BookingFormAirportDetails: View {
    var airports: [Airport]
    var origin: Airport
    var destination: Airport?
    var journey: FlightJourney
    
    @Binding var activePickerRole: AirportPicker.Role?
    
    var body: some View {
        HStack(alignment: .flightLegArrow) {
            OriginAirportButton(origin: origin) {
                self.activePickerRole = .origin
            }
            
            Spacer()
            
            JourneyIcon(journey: self.journey)
            
            Spacer()
            DestinationAirportButton(destination: destination) {
                self.activePickerRole = .destination
            }
        }
    }
}

extension BookingFormAirportDetails {
    @MainActor
    init(airports: [Airport],
         inputData: BookingFormInputData,
         activePickerRole: Binding<AirportPicker.Role?>) {
        self.init(airports: airports,
                  origin: inputData.origin,
                  destination: inputData.destination,
                  journey: inputData.journey,
                  activePickerRole: activePickerRole)
    }
}

struct BookingFormAirportDetails_Previews: PreviewProvider {
    static var previews: some View {
        let airports = [Airport.sfo, .mia, .pmi]
        
        return ForEach(FlightJourney.allCases) { journey in
            VStack {
                BookingFormAirportDetails(
                    airports: airports,
                    origin: .sfo,
                    journey: journey,
                    activePickerRole: .constant(nil))
                .padding()
                Spacer()
            }
        }
    }
}

