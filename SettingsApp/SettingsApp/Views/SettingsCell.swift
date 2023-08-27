//
//  SettingsCell.swift
//  SettingsApp
//
//  Created by pablo borquez on 27/08/23.
//

import SwiftUI

struct SettingsCell: View {
    @Binding var settingsTitleRowContainer: SettingsTitleRowContainer
    
    init(_ settingsTitleRowContainer: Binding<SettingsTitleRowContainer>) {
        self._settingsTitleRowContainer = settingsTitleRowContainer
    }
    
    var body: some View {
        HStack {
            SettingsIcon(self.settingsTitleRowContainer)

            SettingsTitle(self.$settingsTitleRowContainer)
        }
    }
}
