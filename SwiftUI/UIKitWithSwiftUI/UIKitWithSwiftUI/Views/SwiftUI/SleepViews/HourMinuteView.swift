//
//  HourMinuteView.swift
//  UIKitWithSwiftUI
//
//  Created by pablo borquez on 28/09/23.
//

import SwiftUI

struct HourMinuteView: View {
    var value: Int
    var unit: String
    
    var body: some View {
        Text(self.value, format: .number)
            .foregroundStyle(.primary)
            .font(.system(.title2, weight: .semibold))
        Text(self.unit)
            .foregroundStyle(.secondary)
            .font(.system(.footnote, weight: .bold))
    }
}
