//
//  SettingsIcon.swift
//  SettingsApp
//
//  Created by pablo borquez on 27/08/23.
//

import SwiftUI

#if os(macOS)
import AppKit
#endif

struct SettingsIcon: View {
    let settingsRow: SettingsTitleRowContainer
    
    init(_ settingsRow: SettingsTitleRowContainer) {
        self.settingsRow = settingsRow
    }
    
    var body: some View {
        self.image
            .font(.system(size: self.settingsRow.size))
            .foregroundColor(self.settingsRow.foregroundColor)
            .frame(width: 30, height: 30)
            .background(self.settingsRow.imageColor)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(self.settingsRow.imageColor == .white ? .gray : .white,
                            lineWidth: 0.5)
            )
    }
    
    private var image: some View {
        Group {
            if self.existsImage() {
                Image(systemName: self.settingsRow.systemImage)
            } else {
                Image(self.settingsRow.systemImage)
            }
        }
    }
    
    private func existsImage() -> Bool {
        #if os(macOS)
        return NSImage(systemSymbolName: self.settingsRow.systemImage,
                       accessibilityDescription: nil) != nil
        #else
        return UIImage(systemName: self.settingsRow.systemImage) != nil
        #endif
    }
}

struct SettingsIcon_Previews: PreviewProvider {
    static var previews: some View {
        SettingsIcon(SettingsTitleValueRowContainer.createBluetooth())
    }
}
