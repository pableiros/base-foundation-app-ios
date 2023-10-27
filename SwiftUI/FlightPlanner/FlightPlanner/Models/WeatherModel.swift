//
//  WeatherModel.swift
//  FlightPlanner
//
//  Created by pablo borquez on 20/10/23.
//

import Foundation
import WeatherKit
import os

@MainActor
class WeatherData: ObservableObject {
    let logger = Logger(subsystem: "com.example.apple-samplecode.FlightPlanner.WeatherData", category: "Model")
    
    @Published private var _currentWeathers = [Airport.ID: CurrentWeather]()
    @Published private var _dailyForecasts = [Airport.ID: Forecast<DayWeather>]()
    @Published private var _hourlyForecasts = [Airport.ID: Forecast<HourWeather>]()
    
    static let shared = WeatherData()
    
    private let service = WeatherService.shared
    
    subscript(airport id: Airport.ID) -> CurrentWeather? {
        self._currentWeathers[id]
    }
    
    subscript(airport id: Airport.ID) -> Forecast<DayWeather>? {
        self._dailyForecasts[id]
    }
    
    subscript(airport id: Airport.ID) -> Forecast<HourWeather>? {
        self._hourlyForecasts[id]
    }
    
    @discardableResult
    func weather(for airport: Airport) async -> CurrentWeather? {
        let currentWeather = await Task.detached(priority: .userInitiated) {
            let forcast = try? await self.service.weather(
                for: airport.location,
                including: .current)
            return forcast
        }.value
        
        self._currentWeathers[airport.id] = currentWeather
        
        return currentWeather
    }
    
    @discardableResult
    func dailyForecast(for airport: Airport) async -> Forecast<DayWeather>? {
        let dayWeather = await Task.detached(priority: .userInitiated) {
            let forcast = try? await self.service.weather(
                for: airport.location,
                including: .daily)
            return forcast
        }.value
        
        self._dailyForecasts[airport.id] = dayWeather
        
        return dayWeather
    }
    
    @discardableResult
    func hourlyForecast(for airport: Airport) async -> Forecast<HourWeather>? {
        let hourWeather = await Task.detached(priority: .userInitiated) {
            let forcast = try? await self.service.weather(
                for: airport.location,
                including: .hourly)
            return forcast
        }.value
        
        self._hourlyForecasts[airport.id] = hourWeather
        
        return hourWeather
    }
}

