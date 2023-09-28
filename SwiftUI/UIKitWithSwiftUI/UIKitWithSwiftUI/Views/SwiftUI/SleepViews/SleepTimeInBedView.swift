//
//  SleepTimeInBedView.swift
//  UIKitWithSwiftUI
//
//  Created by pablo borquez on 28/09/23.
//

import SwiftUI

struct SleepTimeInBedView: View {
    var latestSample: SleepSample
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Time in Bed")
                .foregroundStyle(.secondary)
                .font(.system(.footnote, weight: .bold))
            HStack(alignment: .firstTextBaseline, spacing: 2) {
                HourMinuteView(value: latestSample.durationHours, unit: "h")
                HourMinuteView(value: latestSample.durationMinutes, unit: "m")
            }
        }
    }
}
