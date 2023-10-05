//
//  BookingFormInputData.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import Foundation

@MainActor
struct BookingFormInputData: Sendable {
    var journey: FlightJourney
    var passengerInfo: PassengerInfo
    var destination: Airport?
    var arrivalDate: Date
    private var originInfo: FlightInfo
    
    init(journey: FlightJourney = .roundTrip,
         passengerInfo: PassengerInfo = PassengerInfo(adultsCount: 1),
         origin: Airport = .sfo,
         departureDate: Date = .now,
         destination: Airport? = nil,
         arrivalDate: Date = .now) {
        self.journey = journey
        self.passengerInfo = passengerInfo
        self.destination = destination
        self.arrivalDate = arrivalDate
        self.originInfo = FlightInfo(date: departureDate, airport: origin)
    }
    
    private var destinationInfo: FlightInfo? {
        guard let airport = self.destination else { return nil }
        
        return FlightInfo(date: self.arrivalDate, airport: airport)
    }
    
    var origin: Airport {
        get { self.originInfo.airport }
        set { self.originInfo.airport = newValue }
    }
    
    var departureDate: Date {
        get { self.originInfo.date }
        set { self.originInfo.date = newValue }
    }
    
    var flightInfo: [FlightInfo]? {
        guard let destinationInfo = destinationInfo else { return nil }
        
        switch journey {
        case .oneWay:
            return [self.originInfo, destinationInfo]
        case .roundTrip:
            let arrivalDate = destinationInfo.date
            let destination = destinationInfo.airport
            let departingFlightInfo = [
                self.originInfo,
                FlightInfo(date: departureDate, airport: destination)
            ]
            
            let returnFlightInfo = [
                destinationInfo,
                FlightInfo(date: arrivalDate, airport: origin)
            ]
            
            return departingFlightInfo + returnFlightInfo
        }
    }
    
    func save(to flightModel: FlightModel, in calendar: Calendar) async {
        guard let flightInfo = self.flightInfo else { return }
        
        let newSegment = FlightSegmentGenerator.segment(byAdding: flightInfo, in: calendar)
        
        if let segment = newSegment {
            flightModel.addSegment(segment)
        }
    }
}
