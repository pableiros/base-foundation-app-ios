//
//  ForecastGridRow.swift
//  FlightPlanner
//
//  Created by pablo borquez on 20/10/23.
//

import SwiftUI

struct ForecastGridRow: View {
    var forecast: FlightForecastInfo
    
    var body: some View {
        GridRow {
            if forecast.isHourlyForecast {
                Text(forecast.date, format: timeFormat)
            } else {
                Text(forecast.date, format: dateFormat)
            }
            Image(systemName: forecast.symbolName)
            if case let .hourly(temp) = forecast.temperature {
                Text(formattedTemperature(temp))
            } else if case let .daily(high, low) = forecast.temperature {
                Text(formattedTemperature(high))
                Text(formattedTemperature(low))
            }
            if forecast.isHourlyForecast {
                Text(forecast.precipitation)
                Text(formattedSpeed(forecast.windSpeed))
            } else {
                Text(formattedPrecipitation(forecast.precipitation,
                    chance: forecast.precipitationChance))
            }
        }
    }
    
    var dateFormat: Date.FormatStyle {
        Date.FormatStyle()
            .weekday(.abbreviated)
            .month(.defaultDigits)
            .day(.defaultDigits)
    }
    
    var timeFormat: Date.FormatStyle {
        Date.FormatStyle().hour(.defaultDigits(amPM: .abbreviated))
    }
    
    func formattedTemperature(_ temp: Measurement<UnitTemperature>) -> String {
        temp.formatted(.measurement(width: .abbreviated, usage: .weather))
    }
    
    func formattedSpeed(_ speed: Measurement<UnitSpeed>) -> String {
        speed.formatted(.measurement(width: .abbreviated, usage: .general))
    }
    
    func formattedPrecipitation(_ precip: String, chance: Double) -> String {
        guard chance > 0 else { return precip }
        
        let percentage = Int(chance * 100)
        
        return precip + " (\(percentage)%)"
    }
}
