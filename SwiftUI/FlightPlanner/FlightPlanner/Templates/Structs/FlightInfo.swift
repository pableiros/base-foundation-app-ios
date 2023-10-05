//
//  FlightInfo.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import Foundation

struct FlightInfo: Hashable, Sendable {
    var date: Date = .now
    var airport: Airport
}

#if DEBUG
extension FlightInfo {
    static var sfo: FlightInfo {
        FlightInfo(date: .now, airport: .sfo)
    }
}
#endif
