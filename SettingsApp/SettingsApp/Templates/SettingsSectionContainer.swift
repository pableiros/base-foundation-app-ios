//
//  SettingsSectionContainer.swift
//  SettingsApp
//
//  Created by pablo borquez on 27/08/23.
//

import Foundation

class SettingsSectionContainer: ObservableObject, Identifiable {
    @Published var rows = [SettingsTitleRowContainer]()
    
    init(rows: [SettingsTitleRowContainer] = [SettingsTitleRowContainer]()) {
        self.rows = rows
    }
    
    static func createSections() -> [SettingsSectionContainer] {
        return [
            .createConectividad()
        ]
    }
    
    static func createConectividad() -> SettingsSectionContainer {
        SettingsSectionContainer(rows: [
            SettingsToggleRowContainer.createModoVuelo(),
            SettingsTitleValueRowContainer.createWifi(),
            SettingsTitleValueRowContainer.createBluetooth(),
            SettingsTitleRowContainer.createRedCelular(),
            SettingsTitleValueRowContainer.createCompartirCelular()
        ])
    }
}
