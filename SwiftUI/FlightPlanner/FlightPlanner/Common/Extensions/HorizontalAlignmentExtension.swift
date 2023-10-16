//
//  HorizontalAlignmentExtension.swift
//  FlightPlanner
//
//  Created by pablo borquez on 16/10/23.
//

import SwiftUI

extension HorizontalAlignment {
    struct FlightListLegRowArrow: AlignmentID {
        static func defaultValue(in dimensions: ViewDimensions) -> CGFloat {
            dimensions[HorizontalAlignment.center]
        }
    }
    
    static let arrow = HorizontalAlignment(FlightListLegRowArrow.self)
}
