//
//  HeartRateTitleView.swift
//  UIKitWithSwiftUI
//
//  Created by pablo borquez on 21/09/23.
//

import SwiftUI

struct HeartRateTitleView: View {
    var time: Date
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Label("Heart Rate", systemImage: "heart.fill")
                .foregroundStyle(.pink)
                .font(.system(.subheadline, weight: .bold))
                .layoutPriority(1)
            Spacer()
            Text(time, style: .time)
                .foregroundStyle(.secondary)
                .font(.footnote)
        }
    }
}
