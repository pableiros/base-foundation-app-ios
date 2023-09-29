//
//  StepCountCellView.swift
//  UIKitWithSwiftUI
//
//  Created by pablo borquez on 29/09/23.
//

import SwiftUI

struct StepCountCellView: View {
    var data: StepData
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(self.data.date, format: .dateTime.weekday())
                .textCase(.uppercase)
                .foregroundStyle(.secondary)
                .font(.system(.title3, weight: .bold).uppercaseSmallCaps())
                .frame(minWidth: 50)
            
            HStack(alignment: .firstTextBaseline, spacing: 2) {
                Text(self.data.stepCount, format: .number)
                    .foregroundStyle(.primary)
                    .font(.system(.title, weight: .semibold))
                    .alignmentGuide(.listRowSeparatorLeading) { $0[.leading] }
            
                Text("steps")
                    .foregroundStyle(.orange)
                    .font(.system(.subheadline, weight: .bold))
            }
            
            Spacer()
        }
    }
}
