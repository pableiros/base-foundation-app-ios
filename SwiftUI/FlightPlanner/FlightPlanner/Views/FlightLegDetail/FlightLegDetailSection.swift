//
//  FlightLegDetailSection.swift
//  FlightPlanner
//
//  Created by pablo borquez on 20/10/23.
//

import SwiftUI
import WeatherKit

struct FlightLegDetailSection: View {
    @Environment(\.calendar) private var calendar
    @EnvironmentObject private var weatherData: WeatherData
    
    var info: FlightInfo
    var weather: CurrentWeather?
    var tintColor: Color
    
    var forecastInfo: [FlightForecastInfo] {
        self.hourlyForecastInfo.isEmpty ? self.dailyForecastInfo : self.hourlyForecastInfo
    }
    
    var dailyForecast: Forecast<DayWeather>? {
        self.weatherData[airport: self.info.airport.id]
    }
    
    var hourlyForecast: Forecast<HourWeather>? {
        self.weatherData[airport: self.info.airport.id]
    }
    
    var dailyForecastInfo: [FlightForecastInfo] {
        guard let dailyForecast = self.dailyForecast else { return [] }
        
        return dailyForecast.forecast
            .filter { $0.date >= self.info.date }
            .prefix(7)
            .map(FlightForecastInfo.init)
    }
    
    var hourlyForecastInfo: [FlightForecastInfo] {
        guard let hourlyForecast = self.hourlyForecast else { return [] }
        
        return hourlyForecast.forecast
            .filter { $0.date >= self.info.date }
            .prefix(7)
            .map(FlightForecastInfo.init)
    }
    
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "M/d"
        
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading) {
            self.dateTime
            
            HStack(alignment: .flightLegDetailAirplane) {
                self.airplane
                
                VStack(alignment: .leading) {
                    self.header
                    
                    Spacer(minLength: 24)
                    
                    FlightLegDetailWeatherGrid(flightInfo: self.info,
                                               forecastInfo: self.forecastInfo)
                    Spacer()
                }
                
                Spacer()
            }
        }
        .padding()
        .foregroundStyle(.secondary)
        .task {
            Task.detached { @MainActor in
                await self.weatherData.hourlyForecast(for: self.info.airport)
                await self.weatherData.dailyForecast(for: self.info.airport)
            }
        }
    }
    
    var dateTime: some View {
        HStack {
            Text(self.info.date, formatter: Self.dateFormatter)
            Text(self.info.date, style: .time)
        }
        .padding(.bottom, 4)
    }
    
    var airplane: some View {
        VStack {
            Image(systemName: "airplane")
                .foregroundColor(self.tintColor)
                .rotationEffect(.degrees(90))
                .font(.title)
                .alignmentGuide(.flightLegDetailAirplane) { dimensions in
                    dimensions[VerticalAlignment.center]
                }
            Spacer(minLength: 24)
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .frame(width: 2, height: 160)
                .overlay(alignment: .bottom) {
                    Circle()
                        .frame(width: 12, height: 12)
                    Circle()
                        .fill(Color(.systemBackground))
                        .frame(width: 10, height: 10)
                    Circle()
                        .fill(self.tintColor)
                        .frame(width: 6, height: 6)
                }
        }
    }
    
    var header: some View {
        Text(self.info.airport.code)
            .font(.title)
            .fontWeight(.medium)
            .foregroundColor(.primary)
            .alignmentGuide(.flightLegDetailAirplane) { dimensions in
                dimensions[VerticalAlignment.center]
            }
    }
}

#Preview {
    FlightLegDetailSection(info: .sfo, tintColor: .blue)
}
