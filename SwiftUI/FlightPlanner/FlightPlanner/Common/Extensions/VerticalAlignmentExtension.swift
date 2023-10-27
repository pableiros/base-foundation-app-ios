//
//  VerticalAlignmentExtension.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import SwiftUI

extension VerticalAlignment {
    struct FlightLegArrow: AlignmentID {
        static func defaultValue(in dimensions: ViewDimensions) -> CGFloat {
            dimensions[VerticalAlignment.center]
        }
    }
    
    struct FlightLegDetailAirplane: AlignmentID {
        static func defaultValue(in dimension: ViewDimensions) -> CGFloat {
            dimension[VerticalAlignment.center]
        }
    }
    
    static let flightLegArrow = VerticalAlignment(FlightLegArrow.self)
    
    static let flightLegDetailAirplane: VerticalAlignment = {
        VerticalAlignment(FlightLegDetailAirplane.self)
    }()
}
