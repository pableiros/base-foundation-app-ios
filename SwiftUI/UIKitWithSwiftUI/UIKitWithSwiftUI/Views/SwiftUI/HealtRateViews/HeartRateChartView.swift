//
//  HeartRateChartView.swift
//  UIKitWithSwiftUI
//
//  Created by pablo borquez on 22/09/23.
//

import SwiftUI
import Charts

struct HeartRateChartView: View {
    var heartRateSamples: [HeartRateSample]
    
    var body: some View {
        Chart(self.heartRateSamples) { sample in
            LineMark(x: .value("Time", sample.time),
                     y: .value("Beats Per Minute", sample.beatsPerMinute))
            .symbol(Circle().strokeBorder(lineWidth: 2))
            .symbolSize(CGSize(width: 6, height: 6))
            .foregroundStyle(.pink)
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .chartYScale(domain: .automatic(includesZero: false))
        .padding(.vertical, 8)
    }
}
