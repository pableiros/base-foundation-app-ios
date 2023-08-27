//
//  SettingsTitleValueRowContainer.swift
//  SettingsApp
//
//  Created by pablo borquez on 27/08/23.
//

import SwiftUI

class SettingsTitleValueRowContainer: SettingsTitleRowContainer {
    @Published var value = ""
    
    init(systemImage: String, imageColor: Color, title: String, value: String) {
        super.init(systemImage: systemImage, imageColor: imageColor, title: title)
        self.value = value
    }
    
    static func createWifi() -> SettingsTitleValueRowContainer {
        return SettingsTitleValueRowContainer(systemImage: "wifi",
                                              imageColor: .blue,
                                              title: "Wi-Fi",
                                              value: "Megacable_5G_65B4")
    }
    
    static func createBluetooth() -> SettingsTitleValueRowContainer {
        return SettingsTitleValueRowContainer(systemImage: "logo.bluetooth",
                                              imageColor: .blue,
                                              title: "Bluetooth",
                                              value: "Activado")
    }
    
    static func createCompartirCelular() -> SettingsTitleRowContainer {
        return SettingsTitleValueRowContainer(systemImage: "personalhotspot",
                                              imageColor: .green,
                                              title: "Compartir internet",
                                              value: "Desactivado")
    }
}

