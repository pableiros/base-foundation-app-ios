//
//  SleepChartView.swift
//  UIKitWithSwiftUI
//
//  Created by pablo borquez on 28/09/23.
//

import SwiftUI
import Charts

struct SleepChartView: View {
    var sleepSamples: [SleepSample]
    
    var body: some View {
        Chart(self.sleepSamples) { sample in
            RuleMark(x: .value("date", sample.date),
                     yStart: .value("Start", sample.startMinute),
                     yEnd: .value("End", sample.startMinute + sample.totalMinutes))
            .foregroundStyle(.teal)
            .lineStyle(.init(lineWidth: 10, lineCap: .round))
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .chartYScale(domain: .automatic(includesZero: false))
        .padding(.horizontal, 6)
        .padding(.top)
        .padding(.bottom, 4)
        .frame(height: 60)
    }
}
