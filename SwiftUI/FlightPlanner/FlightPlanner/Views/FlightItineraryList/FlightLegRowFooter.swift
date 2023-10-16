//
//  FlightLegRowFooter.swift
//  FlightPlanner
//
//  Created by pablo borquez on 16/10/23.
//

import SwiftUI

private let formatter = RelativeDateTimeFormatter()

struct FlightLegRowFooter: View {
    var alignment: HorizontalAlignment
    var leg: FlightLeg
    
    private let spacing = CGFloat(2)
    
    var body: some View {
        switch self.alignment {
        case .leading:
            self.leadingContent
        case .trailing:
            self.trailingContent
        default:
            self.centerContent
        }
    }
    
    var leadingContent: some View {
        VStack(alignment: .leading, spacing: spacing) {
            Text("Flight")
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(leg.designator)
                .fontWeight(.medium)
        }
    }
    
    var centerContent: some View {
        VStack(spacing: spacing) {
            Text("Gate")
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(leg.gate)
                .fontWeight(.medium)
        }
    }
    
    var trailingContent: some View {
        VStack(alignment: .trailing, spacing: self.spacing) {
            Text("Duration")
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(formatter.localizedString(fromTimeInterval: self.leg.duration))
                .fontWeight(.medium)
        }
    }
}

#Preview {
    VStack {
        FlightLegRowFooter(alignment: .leading, leg: .sfoToMia)
        FlightLegRowFooter(alignment: .center, leg: .miaToPmi)
        FlightLegRowFooter(alignment: .trailing, leg: .sfoToMia)
    }
}
