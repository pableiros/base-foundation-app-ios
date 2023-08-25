//
//  ParkingSpot.swift
//  BaseFoundationApp
//
//  Created by pablo borquez on 18/08/23.
//

import Foundation
import CoreLocation

struct ParkingSpot: Identifiable, Hashable {
    var id: String { name }
    var name: String
    var location: CLLocation
    var cameraDistance: Double = 1000
    
    static let applePark = ParkingSpot(
        name: String(localized: "Apple Park", bundle: .main, comment: "Apple's headquarters in California."),
        location: CLLocation(latitude: 37.3348, longitude: -122.0090),
        cameraDistance: 500
    )
    
    static let infiniteLoop = ParkingSpot(
        name: String(localized: "Infinite Loop", comment: "One of Apple's buildings in California."),
        location: CLLocation(latitude: 37.3317, longitude: -122.0302),
        cameraDistance: 500
    )
    
    static let bigBen = ParkingSpot(
        name: String(localized: "Big Ben", bundle: .main, comment: "A landmark in London."),
        location: CLLocation(latitude: 51.4994, longitude: -0.1245),
        cameraDistance: 400
    )
    
    static let goldenGateBridge = ParkingSpot(
        name: String(localized: "Golden Gate Bridge", bundle: .main, comment: "A landmark in San Francisco."),
        location: CLLocation(latitude: 37.8199, longitude: -122.4783),
        cameraDistance: 2000
    )
    
    static let statueLiberty = ParkingSpot(
        name: String(localized: "Statue of Liberty", bundle: .main, comment: ""),
        location: CLLocation(latitude: 40.689247, longitude: -74.044502),
        cameraDistance: 200
    )
    
    static let oneWorldTradeCenter = ParkingSpot(
        name: String(localized: "One WTC", bundle: .main, comment: ""),
        location: CLLocation(latitude: 40.712742, longitude: -74.013382),
        cameraDistance: 1000
    )
    
    static let eiffelTower = ParkingSpot(
        name: String(localized: "Eiffel Tower", bundle: .main, comment: ""),
        location: CLLocation(latitude: 48.858093, longitude: 2.294694),
        cameraDistance: 800
    )
}

