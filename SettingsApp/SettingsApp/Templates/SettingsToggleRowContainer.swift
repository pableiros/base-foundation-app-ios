//
//  SettingsToggleRowContainer.swift
//  SettingsApp
//
//  Created by pablo borquez on 27/08/23.
//

import SwiftUI

class SettingsToggleRowContainer: SettingsTitleRowContainer {
    init(systemImage: String, imageColor: Color, title: String, isSet: Bool) {
        super.init(systemImage: systemImage, imageColor: imageColor, title: title)
        self.isSet = isSet
    }
    
    static func createModoVuelo() -> SettingsToggleRowContainer {
        return SettingsToggleRowContainer(systemImage: "airplane",
                                 imageColor: .orange,
                                 title: "Modo vuelo",
                                 isSet: false)
    }
}
