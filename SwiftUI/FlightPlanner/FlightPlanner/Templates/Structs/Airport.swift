//
//  Airport.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import Foundation
import CoreLocation

struct Airport: Hashable, Identifiable {
    var code: String
    var name: String
    var city: String
    var region: String
    var country: String
    var elevation: Double
    var latitude: Double
    var longitude: Double
    
    var id: String { self.code }
    
    var location: CLLocation {
        CLLocation(latitude: self.latitude, longitude: self.longitude)
    }
    
    var locationDescription: String {
        "\(self.city), \(self.country) (\(self.code))"
    }
    
    var imageName: String {
        Airport.randomImageName(for: self)
    }
    
    // MARK: - private
    
    private struct SeededRandomNumberGenerator: RandomNumberGenerator {
        init(seed: Int) {
            srand48(seed)
        }

        func next() -> UInt64 {
            UInt64(drand48() * Double(UInt64.max))
        }
    }
    
    fileprivate static func randomImageName(for airport: Airport) -> String {
        let imageNames = [
            "City_11_Glass_Skyscrapers",
            "City_13_Civic_Center",
            "City_6_Modern_Building",
            "Landscape_1_Vineyard",
            "Landscape_21_Rainbow",
            "Landscape_22_Sailboats",
            "Landscape_25_Tropical_Sunset_Palms",
            "Landscape_29_Tropical_Sunset_Boat"
        ]
        
        let sum = airport.elevation + airport.latitude + airport.longitude
        let seed = airport.hashValue + Int(sum)
        var generator = SeededRandomNumberGenerator(seed: seed)
     
        return imageNames.randomElement(using: &generator)!
    }
}

extension Airport: Codable {
    enum CodingKeys: String, CodingKey {
        case code
        case name
        case city
        case region
        case country
        case elevation
        case latitude = "lat"
        case longitude = "lon"
    }
}

extension Airport: Comparable {
    static func <(lhs: Airport, rhs: Airport) -> Bool {
        lhs.name < rhs.name
    }
}
#if DEBUG
extension Airport {
    static var all: [Airport] {
        let path = Bundle.main.path(forResource: "Airports", ofType: "json")!
        let fileURL = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: fileURL, options: .mappedIfSafe)
      
        return try! JSONDecoder().decode([Airport].self, from: data)
    }
    
    static var mia: Airport {
        all.first(where: { $0.code == "MIA" })!
    }
    
    static var pmi: Airport {
        all.first(where: { $0.code == "PMI" })!
    }
    
    static var sfo: Airport {
        all.first(where: { $0.code == "SFO" })!
    }
}

extension Sequence where Element == Airport {
    static var all: [Airport] {
        Airport.all
    }
}
#endif
