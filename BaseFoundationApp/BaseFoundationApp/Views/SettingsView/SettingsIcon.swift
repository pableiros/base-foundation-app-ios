//
//  SettingsIcon.swift
//  BaseFoundationApp
//
//  Created by pablo borquez on 20/08/23.
//

import SwiftUI

struct SettingsIcon: View {
    let settingsRow: SettingsTitleRowContainer
    
    init(_ settingsRow: SettingsTitleRowContainer) {
        self.settingsRow = settingsRow
    }
    
    var body: some View {
        self.image
            .font(.system(size: 18))
            .foregroundColor(.white)
            .frame(width: 30, height: 30)
            .background(settingsRow.imageColor)
            .cornerRadius(5)
    }
    
    private var image: some View {
        Group {
            if UIImage(systemName: self.settingsRow.systemImage) != nil {
                Image(systemName: self.settingsRow.systemImage)
            } else {
                Image(self.settingsRow.systemImage)
            }
        }
    }
}

struct SettingsIcon_Previews: PreviewProvider {
    static var previews: some View {
        SettingsIcon(SettingsTitleValueRowContainer.createBluetooth())
    }
}
