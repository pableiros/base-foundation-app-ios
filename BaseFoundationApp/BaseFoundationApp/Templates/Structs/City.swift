//
//  City.swift
//  BaseFoundationApp
//
//  Created by pablo borquez on 18/08/23.
//

import Foundation
import CoreLocation

struct City: Identifiable, Hashable {
    var id: String { name }
    var name: String
    var parkingSpots: [ParkingSpot]
}

extension City {
    static let sanFrancisco = City(
        name: String(localized: "San Francisco", bundle: .main, comment: "A city in California."),
        parkingSpots: [
            ParkingSpot(
                name: String(localized: "Coit Tower", bundle: .main, comment: "A landmark in San Francisco."),
                location: CLLocation(latitude: 37.8024, longitude: -122.4058),
                cameraDistance: 300
            ),
            ParkingSpot(
                name: String(localized: "Fisherman's Wharf", bundle: .main, comment: "A landmark in San Francisco."),
                location: CLLocation(latitude: 37.8099, longitude: -122.4103),
                cameraDistance: 700
            ),
            ParkingSpot(
                name: String(localized: "Ferry Building", bundle: .main, comment: "A landmark in San Francisco."),
                location: CLLocation(latitude: 37.7956, longitude: -122.3935),
                cameraDistance: 450
            ),
            .goldenGateBridge,
            ParkingSpot(
                name: String(localized: "Oracle Park", bundle: .main, comment: "A landmark in San Francisco."),
                location: CLLocation(latitude: 37.7786, longitude: -122.3893),
                cameraDistance: 650
            ),
            ParkingSpot(
                name: String(localized: "The Castro Theatre", bundle: .main, comment: "A landmark in San Francisco."),
                location: CLLocation(latitude: 37.7609, longitude: -122.4350),
                cameraDistance: 400
            ),
            ParkingSpot(
                name: String(localized: "Sutro Tower", bundle: .main, comment: "A landmark in San Francisco."),
                location: CLLocation(latitude: 37.7552, longitude: -122.4528)
            ),
            ParkingSpot(
                name: String(localized: "Bay Bridge", bundle: .main, comment: "A landmark in San Francisco."),
                location: CLLocation(latitude: 37.7983, longitude: -122.3778)
            )
        ]
    )
    
    static let cupertino = City(
        name: String(localized: "Cupertino", bundle: .main, comment: "A city in California."),
        parkingSpots: [
            .applePark,
            .infiniteLoop
        ]
    )
    
    static let london = City(
        name: String(localized: "London", bundle: .main, comment: "A city in England."),
        parkingSpots: [
            .bigBen,
            ParkingSpot(
                name: String(localized: "Buckingham Palace", bundle: .main, comment: "A landmark in London."),
                location: CLLocation(latitude: 51.5014, longitude: -0.1419),
                cameraDistance: 750
            ),
            ParkingSpot(
                name: String(localized: "Marble Arch", bundle: .main, comment: "A landmark in London."),
                location: CLLocation(latitude: 51.5131, longitude: -0.1589)
            ),
            ParkingSpot(
                name: String(localized: "Piccadilly Circus", bundle: .main, comment: "A landmark in London."),
                location: CLLocation(latitude: 51.510_067, longitude: -0.133_869)
            ),
            ParkingSpot(
                name: String(localized: "Shakespeare's Globe", bundle: .main, comment: "A landmark in London."),
                location: CLLocation(latitude: 51.5081, longitude: -0.0972)
            ),
            ParkingSpot(
                name: String(localized: "Tower Bridge", bundle: .main, comment: "A landmark in London."),
                location: CLLocation(latitude: 51.5055, longitude: -0.0754)
            )
        ]
    )
    
    static let all = [cupertino, sanFrancisco, london]
    
    static func identified(by id: City.ID) -> City {
        guard let result = all.first(where: { $0.id == id }) else {
            fatalError("Unknown City ID: \(id)")
        }
        return result
    }
}
