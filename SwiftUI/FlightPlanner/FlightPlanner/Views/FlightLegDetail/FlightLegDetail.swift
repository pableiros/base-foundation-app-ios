//
//  FlightLegDetail.swift
//  FlightPlanner
//
//  Created by pablo borquez on 20/10/23.
//

import SwiftUI
import WeatherKit

struct FlightLegDetail: View {
    @Environment(\.calendar) private var calendar
    
    @StateObject private var weatherData = WeatherData.shared
    
    var leg: FlightLeg
    
    var originWeather: CurrentWeather? {
        return self.weatherData[airport: self.leg.origin.id]
    }
    
    var destinationWeather: CurrentWeather? {
        return self.weatherData[airport: self.leg.destination.id]
    }
    
    var departureInfo: FlightInfo {
        return  FlightInfo(date: self.leg.departure, airport: self.leg.origin)
    }
    
    var arrivalInfo: FlightInfo {
        return FlightInfo(date: self.leg.arrival, airport: self.leg.destination)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                FlightLegDetailBanner(
                    leg: leg,
                    weather: destinationWeather)
                FlightLegDetailSection(
                    info: departureInfo,
                    weather: originWeather,
                    tintColor: Color(leg.color))
                FlightLegDetailSection(
                    info: arrivalInfo,
                    weather: destinationWeather,
                    tintColor: Color(leg.color))
            }
            .backgroundStyle(.background)
            .environmentObject(weatherData)
        }
        .ignoresSafeArea(edges: .top)
        .task {
            Task.detached { @MainActor in
                await weatherData.weather(for: leg.origin)
                await weatherData.weather(for: leg.destination)
            }
        }
    }
}

#Preview {
    FlightLegDetail(leg: .sfoToMia)
}
