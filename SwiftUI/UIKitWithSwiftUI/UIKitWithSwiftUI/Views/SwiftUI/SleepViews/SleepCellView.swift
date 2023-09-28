//
//  SleepCellView.swift
//  UIKitWithSwiftUI
//
//  Created by pablo borquez on 28/09/23.
//

import SwiftUI

struct SleepCellView: View {
    var data: SleepData
    
    var body: some View {
        VStack(alignment: .leading) {
            SleepChartView(sleepSamples: data.samples)
            SleepTimeInBedView(latestSample: data.latestSample)
        }
    }
}
