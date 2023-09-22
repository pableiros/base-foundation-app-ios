//
//  HeartRateCellView.swift
//  UIKitWithSwiftUI
//
//  Created by pablo borquez on 21/09/23.
//

import SwiftUI

struct HeartRateCellView: View {
    var data: HeartRateData
    
    var body: some View {
        VStack(alignment: .leading) {
            HeartRateTitleView(time: data.latestSample.time)
            HStack(alignment: .bottom) {
                HeartRateBPMView(latestSample: data.latestSample)
                Spacer(minLength: 60)
                HeartRateChartView(heartRateSamples: data.samples)
            }
        }
        .padding(.vertical, 8)
    }
}
