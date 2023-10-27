//
//  FlightLegDetailWeatherGrid.swift
//  FlightPlanner
//
//  Created by pablo borquez on 20/10/23.
//

import CoreLocation.CLLocation
import SwiftUI
import WeatherKit

struct FlightLegDetailWeatherGrid: View {
    var flightInfo: FlightInfo
    var forecastInfo: [FlightForecastInfo]
    var headerColor: Color  = .primary
    var contentColor: Color = .gray
    
    var body: some View {
        Grid(alignment: .top) {
            HeaderGridRow(forecastInfo: forecastInfo, headerColor: headerColor)
            if forecastInfo.isEmpty {
                ForEach(0..<5) { _ in
                    GridRow {
                        Text("--")
                        Text("--")
                        Text("--")
                        Text("--")
                        Text("--")
                    }
                }
            } else {
                ForEach(forecastInfo, id: \.date) { forecast in
                    ForecastGridRow(forecast: forecast)
                }
            }
        }
        .foregroundColor(contentColor)
        .font(.callout)
    }
}

struct FlightLegDetailWeatherGrid_Previews: PreviewProvider {
    static var previews: some View {
        let flightInfo = FlightInfo(airport: .sfo)
        return Group {
            FlightLegDetailWeatherGrid(
                flightInfo: flightInfo,
                forecastInfo: [])
            FlightLegDetailWeatherGrid(
                flightInfo: flightInfo,
                forecastInfo: [.hourly])
            FlightLegDetailWeatherGrid(
                flightInfo: flightInfo,
                forecastInfo: [.daily])
        }
    }
}

