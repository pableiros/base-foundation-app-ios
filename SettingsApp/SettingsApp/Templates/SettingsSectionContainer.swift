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
            .createConectividad(),
            .createNotificaciones(),
            .createGeneral(),
            .createAppStore(),
            .createInternalApps(),
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
    
    static func createNotificaciones() -> SettingsSectionContainer {
        SettingsSectionContainer(rows: [
            SettingsTitleRowContainer.createNotificaciones(),
            SettingsTitleRowContainer.createSonidos(),
            SettingsTitleRowContainer.createEnfoque(),
            SettingsTitleRowContainer.createTiempoPantalla(),
        ])
    }
    
    static func createGeneral() -> SettingsSectionContainer {
        SettingsSectionContainer(rows: [
            SettingsTitleRowContainer.createGeneral(),
            SettingsTitleRowContainer.createCentroControl(),
            SettingsTitleRowContainer.createPantallaBrillo(),
            SettingsTitleRowContainer.createPantallaInicio(),
            SettingsTitleRowContainer.createAccesibilidad(),
            SettingsTitleRowContainer.createFondoPantalla(),
            SettingsTitleRowContainer.createSiriBuscar(),
            SettingsTitleRowContainer.createFaceId(),
            SettingsTitleRowContainer.createSOS(),
            SettingsTitleRowContainer.createNotExposicion(),
            SettingsTitleRowContainer.createBateria(),
            SettingsTitleRowContainer.createPrivacidadSeguridad(),
        ])
    }
    
    static func createAppStore() -> SettingsSectionContainer {
        SettingsSectionContainer(rows: [
            SettingsTitleRowContainer.createAppStore(),
            SettingsTitleRowContainer.createWallet(),
        ])
    }
    
    static func createInternalApps() -> SettingsSectionContainer {
        SettingsSectionContainer(rows: [
            SettingsTitleRowContainer.createPasswords(),
            SettingsTitleRowContainer.createContactos(),
            SettingsTitleRowContainer.createCalendario(),
            SettingsTitleRowContainer.createNotas(),
            SettingsTitleRowContainer.createRecordatorios(),
            SettingsTitleRowContainer.createNotasVoz(),
            SettingsTitleRowContainer.createTelefono(),
            SettingsTitleRowContainer.createMensajes(),
            SettingsTitleRowContainer.createFaceTime(),
            SettingsTitleRowContainer.createSafari(),
            SettingsTitleRowContainer.createBolsa(),
            SettingsTitleRowContainer.createClima(),
            SettingsTitleRowContainer.createTraducir(),
            SettingsTitleRowContainer.createMaps(),
            SettingsTitleRowContainer.createBrujula(),
            SettingsTitleRowContainer.createMedicion(),
            SettingsTitleRowContainer.createAtajos(),
            SettingsTitleRowContainer.createSalud(),
        ])
    }
}
