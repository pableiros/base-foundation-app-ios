//
//  AlignmentLabelStyle.swift
//  FlightPlanner
//
//  Created by pablo borquez on 16/10/23.
//

import SwiftUI

struct AlignmentLabelStyle: LabelStyle {
    var alignment: HorizontalAlignment
    
    func makeBody(configuration: Configuration) -> some View {
        if self.alignment == .trailing {
            HStack {
                configuration.title
                configuration.icon
            }
        } else {
            HStack {
                configuration.icon
                configuration.title
            }
        }
    }
}
