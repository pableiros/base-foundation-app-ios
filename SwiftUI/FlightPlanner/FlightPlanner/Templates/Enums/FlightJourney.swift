//
//  FlightJourney.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import Foundation

enum FlightJourney: Int, CaseIterable, Identifiable, Sendable {
    case oneWay
    case roundTrip
    
    var id: Int { self.rawValue }
    
    var title: String {
        switch self {
        case .oneWay:
            return "One way"
        case .roundTrip:
            return "Round trip"
        }
    }
    
    var systemImage: String {
        switch self {
        case .oneWay:
            return "arrow.right"
        case .roundTrip:
            return "arrow.right.arrow.left"
        }
    }
}
