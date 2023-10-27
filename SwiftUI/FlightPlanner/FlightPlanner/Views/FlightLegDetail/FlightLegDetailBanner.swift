//
//  FlightLegDetailBanner.swift
//  FlightPlanner
//
//  Created by pablo borquez on 20/10/23.
//

import SwiftUI
import WeatherKit

struct FlightLegDetailBanner: View {
    @Environment(\.calendar) private var calendar
    
    var leg: FlightLeg
    var weather: CurrentWeather?
    
    var title: String {
        let origin = self.leg.origin.locationDescription
        let destination = self.leg.destination.locationDescription
        
        return "Flight from \(origin), \nto \(destination)"
    }
    
    var subheadlines: some View {
        HStack {
            Text(self.hasSameDayFlights ? self.flightDate : self.flightDateRange)
            Spacer()
            Text(self.weather?.temperature.formatted() ?? "--")
                .alignmentGuide(.weatherSymbol) { dimensions in
                    dimensions[HorizontalAlignment.center]
                }
        }
        .font(.subheadline)
    }
    
    var hasSameDayFlights: Bool {
        self.calendar.isDate(self.departure, inSameDayAs: self.arrival)
    }
    
    var flightDate: LocalizedStringKey {
        "\(self.departure, style: .date)"
    }
    
    var flightDateRange: LocalizedStringKey {
        "\(self.departure, style: .date) – \(self.arrival, style: .date)"
    }
    
    var departure: Date {
        self.leg.departure
    }
    
    var arrival: Date {
        self.leg.arrival
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            self.image
            VStack(alignment: .weatherSymbol, spacing: 6) {
                self.headlines
                self.subheadlines
            }
            .padding(20)
            .foregroundStyle(.background.shadow(.drop(radius: 2)))
            .background {
                Color(self.leg.color)
                    .shadow(radius: 4, y: -4)
            }
        }
    }
    
    var image: some View {
        Image(self.leg.destination.imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 300)
            .clipped()
            .overlay {
                LinearGradient(
                    colors: [Color(.systemBackground), .clear, .clear],
                    startPoint: .top,
                    endPoint: .bottom)
            }
    }
    
    var headlines: some View {
        HStack {
            Text(self.title)
                .font(.headline)
                .lineLimit(2, reservesSpace: true)
            Spacer()
            Group {
                if let systemName = self.weather?.symbolName {
                    Text(Image(systemName: systemName))
                } else {
                    Text("--")
                }
            }
            .font(.title)
            .alignmentGuide(.weatherSymbol) { dimensions in
                dimensions[HorizontalAlignment.center]
            }
        }
        .fontWeight(.bold)
    }
}

#Preview {
    FlightLegDetailBanner(leg: .sfoToMia)
}
