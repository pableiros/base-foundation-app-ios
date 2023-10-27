//
//  FlightForecastInfo.swift
//  FlightPlanner
//
//  Created by pablo borquez on 20/10/23.
//

import Foundation
import WeatherKit

struct FlightForecastInfo {
    enum Temperature {
        typealias Value = Measurement<UnitTemperature>
        
        case daily(high: Value, low: Value)
        case hourly(Value)
        
        var isDaily: Bool {
            switch self {
            case .daily:
                return true
            case .hourly:
                return false
            }
        }
    }
    
    var date: Date
    var condition: String
    var symbolName: String
    var temperature: Temperature
    var precipitation: String
    var precipitationChance: Double
    var windSpeed: Measurement<UnitSpeed>
    
    var isDailyForecast: Bool {
        temperature.isDaily
    }
    
    var isHourlyForecast: Bool {
        !temperature.isDaily
    }
}

extension FlightForecastInfo {
    init(_ forecast: DayWeather) {
        self.date = forecast.date
        self.condition = forecast.condition.description
        self.symbolName = forecast.symbolName
        self.temperature = .daily(high: forecast.highTemperature,
                             low: forecast.lowTemperature)
        self.precipitation = forecast.precipitation.description
        self.precipitationChance = forecast.precipitationChance
        self.windSpeed = forecast.wind.speed
    }
    
    init(_ forecast: HourWeather) {
        self.date = forecast.date
        self.condition = forecast.condition.description
        self.symbolName = forecast.symbolName
        self.temperature = .hourly(forecast.temperature)
        self.precipitation = forecast.precipitation.description
        self.precipitationChance = forecast.precipitationChance
        self.windSpeed = forecast.wind.speed
    }
}

#if DEBUG
extension FlightForecastInfo {
    static var daily: FlightForecastInfo {
        FlightForecastInfo(date: .now,
                           condition: condition,
                           symbolName: "cloud.sun.rain",
                           temperature: dailyTemperature,
                           precipitation: "rain",
                           precipitationChance: 0.15,
                           windSpeed: windSpeed)
    }
    
    static var hourly: FlightForecastInfo {
        FlightForecastInfo(date: .now,
                           condition: condition,
                           symbolName: "cloud.sun.rain",
                           temperature: hourlyTemperature,
                           precipitation: "rain",
                           precipitationChance: 0.15,
                           windSpeed: windSpeed)
    }
    
    private static let condition =
    """
    Lorem ipsum dolor sit amet, \
    consectetur adipiscing elit."
    """
    
    private static var hourlyTemperature: FlightForecastInfo.Temperature = {
        let temp = Measurement<UnitTemperature>(value: 60.1, unit: .fahrenheit)
        return .hourly(temp)
    }()
    
    private static var dailyTemperature: FlightForecastInfo.Temperature = {
        let high = Measurement<UnitTemperature>(value: 81.7, unit: .fahrenheit)
        let low = Measurement<UnitTemperature>(value: 52.4, unit: .fahrenheit)
        return .daily(high: high, low: low)
    }()
    
    private static var windSpeed: Measurement<UnitSpeed> = {
        Measurement<UnitSpeed>(value: 4.2, unit: .milesPerHour)
    }()
}
#endif
