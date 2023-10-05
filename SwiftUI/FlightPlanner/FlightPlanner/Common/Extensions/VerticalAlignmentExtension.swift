//
//  VerticalAlignmentExtension.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import SwiftUI

extension VerticalAlignment {
    private struct FlightLegArrow: AlignmentID {
        static func defaultValue(in dimensions: ViewDimensions) -> CGFloat {
            dimensions[VerticalAlignment.center]
        }
    }

    static let flightLegArrow = VerticalAlignment(FlightLegArrow.self)
}
