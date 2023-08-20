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
}

