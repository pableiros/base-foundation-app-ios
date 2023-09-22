//
//  HeartRateBPMView.swift
//  UIKitWithSwiftUI
//
//  Created by pablo borquez on 22/09/23.
//

import SwiftUI

struct HeartRateBPMView: View {
    var latestSample: HeartRateSample
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 2) {
            Text(self.latestSample.beatsPerMinute, format: .number)
                .foregroundStyle(.primary)
                .font(.system(.title, weight: .semibold))
            Text("BPM")
                .foregroundStyle(.secondary)
                .font(.system(.subheadline, weight: .bold))
        }
    }
}
