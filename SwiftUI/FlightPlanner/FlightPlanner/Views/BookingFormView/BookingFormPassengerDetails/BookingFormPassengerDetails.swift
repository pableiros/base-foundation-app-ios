//
//  BookingFormPassengerDetails.swift
//  FlightPlanner
//
//  Created by pablo borquez on 12/10/23.
//

import SwiftUI

struct BookingFormPassengerDetails: View {
    @Binding var passengerInfo: PassengerInfo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Passengers")
                .font(.caption)
            
            PassengersStepper(value: self.$passengerInfo.adultsCount) {
                Text("Adults: \(self.passengerInfo.adultsCount)")
                Text("Over 12 years old")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            } label: {
                Label("Adults", systemImage: "person")
            }
            
            PassengersStepper(value: self.$passengerInfo.childrenCount) {
                Text("Children: \(self.passengerInfo.childrenCount)")
                Text("Between 2 and 11 years old")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            } label: {
                Label("Children", systemImage: "person")
            }
           
            PassengersStepper(value: self.$passengerInfo.infantsCount) {
                Text("Infants: \(self.passengerInfo.infantsCount)")
                Text("Under 2 years old")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            } label: {
                Label("Infants", systemImage: "person")
            }
        }
    }
}

struct BookingFormPassengerDetails_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(0..<4, id: \.self) { count in
            let passengerInfo = PassengerInfo(
                adultsCount: count,
                childrenCount: count,
                infantsCount: count)
            BookingFormPassengerDetails(passengerInfo: .constant(passengerInfo))
        }
    }
}

