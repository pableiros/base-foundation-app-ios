//
//  SettingsTitle.swift
//  SettingsApp
//
//  Created by pablo borquez on 27/08/23.
//

import SwiftUI

struct SettingsTitle: View {
    @Binding var settingsRowContainer: SettingsTitleRowContainer
    
    init(_ settingsRowContainer: Binding<SettingsTitleRowContainer>) {
        self._settingsRowContainer = settingsRowContainer
    }
    
    var body: some View {
        LabeledContent {
            if self.settingsRowContainer is SettingsToggleRowContainer {
                Toggle("", isOn: self.$settingsRowContainer.isSet)
            } else if let settingsTitleValueContainer = self.settingsRowContainer as? SettingsTitleValueRowContainer {
                Text(settingsTitleValueContainer.value)
            }
        } label: {
            Text(self.settingsRowContainer.title)
        }
        .padding(.leading, 6)
    }
}
