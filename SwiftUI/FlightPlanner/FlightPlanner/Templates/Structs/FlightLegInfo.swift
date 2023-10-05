//
//  FlightLegInfo.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import Foundation

struct FlightLegInfo: Hashable, Sendable {
    var origin: FlightInfo
    var destination: FlightInfo
}
