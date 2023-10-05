//
//  FlightSegmentGenerator.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import Foundation

enum FlightSegmentGenerator {
    static func segment(byAdding flightInfo: [FlightInfo], in calendar: Calendar ) -> FlightSegment? {
        let linkedPairs = zip(flightInfo, flightInfo.dropFirst())
        
        let legInfo: [FlightLegInfo] = linkedPairs.compactMap {
            guard $0.airport != $1.airport else { return nil }
            
            return FlightLegInfo(origin: $0, destination: $1)
        }
        
        var legs = [FlightLeg]()
      
        for info in legInfo {
            if let leg = FlightLegGenerator.makeLeg(for: info, in: calendar) {
                legs.append(leg)
            }
        }
        
        return FlightSegment(legs: legs)
    }
}
