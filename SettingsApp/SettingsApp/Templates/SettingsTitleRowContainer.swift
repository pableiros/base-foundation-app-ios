//
//  SettingsTitleRowContainer.swift
//  SettingsApp
//
//  Created by pablo borquez on 27/08/23.
//

import SwiftUI

class SettingsTitleRowContainer: ObservableObject, Identifiable {
    var id = UUID()
    
    var systemImage = ""
    var imageColor: Color = .blue
    
    @Published var title: String = ""
    @Published var isSet = false
    @Published var size: CGFloat = 18
    @Published var foregroundColor: Color = .white

    init(systemImage: String,
         imageColor: Color,
         title: String,
         size: CGFloat = 18,
         foregroundColor: Color = .white) {
        self.systemImage = systemImage
        self.imageColor = imageColor
        self.title = title
        self.size = size
        self.foregroundColor = foregroundColor
    }
    
    static func createRedCelular() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "antenna.radiowaves.left.and.right",
                                         imageColor: .green,
                                         title: "Red celular")
    }
    
    static func createNotificaciones() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "bell.badge.fill",
                                         imageColor: .red,
                                         title: "Notificaciones")
    }
    
    static func createSonidos() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "speaker.wave.3.fill",
                                         imageColor: .pink,
                                         title: "Sonidos y vibración")
    }
    
    static func createEnfoque() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "moon.fill",
                                         imageColor: .indigo,
                                         title: "Enfoque")
    }
    
    static func createTiempoPantalla() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "hourglass",
                                         imageColor: .indigo,
                                         title: "Tiempo en pantalla")
    }
    
    static func createGeneral() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "gear",
                                         imageColor: .gray,
                                         title: "General")
    }
    
    static func createCentroControl() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "switch.2",
                                         imageColor: .gray,
                                         title: "Centro de control")
    }
    
    static func createPantallaBrillo() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "textformat.size",
                                         imageColor: .blue,
                                         title: "Pantalla y brillo")
    }
    
    static func createPantallaInicio() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "dock.rectangle",
                                         imageColor: .blue,
                                         title: "Pantalla de inicio")
    }
    
    static func createAccesibilidad() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "figure.mixed.cardio",
                                         imageColor: .blue,
                                         title: "Accesibilidad")
    }
    
    static func createFondoPantalla() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "atom",
                                         imageColor: .cyan,
                                         title: "Fondo de pantalla")
    }
    
    static func createSiriBuscar() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "circlebadge.2.fill",
                                         imageColor: .indigo,
                                         title: "Siri y Buscar")
    }
    
    static func createFaceId() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "faceid",
                                         imageColor: .green,
                                         title: "Face ID y código",
                                         size: 20)
    }
    
    static func createSOS() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "sos",
                                         imageColor: .red,
                                         title: "Emergencia SOS",
                                         size: 15)
    }
    
    static func createNotExposicion() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "microbe.fill",
                                         imageColor: .white,
                                         title: "Notificaciones de exposición",
                                         size: 22,
                                         foregroundColor: .red)
    }
    
    static func createBateria() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "battery.100",
                                         imageColor: .green,
                                         title: "Batería",
                                         size: 15)
    }
    
    static func createPrivacidadSeguridad() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "hand.raised.fill",
                                         imageColor: .blue,
                                         title: "Privacidad y seguridad")
    }
    
    static func createAppStore() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "logo.appstore",
                                         imageColor: .blue,
                                         title: "App Store")
    }
    
    static func createWallet() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "wallet.pass.fill",
                                         imageColor: .black,
                                         title: "Wallet y Apple Pay")
    }
    
    static func createPasswords() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "key.fill",
                                         imageColor: .gray,
                                         title: "Contraseñas")
    }
    
    static func createContactos() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "person.circle",
                                         imageColor: .brown,
                                         title: "Contactos")
    }
    
    static func createCalendario() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "calendar",
                                         imageColor: .white,
                                         title: "Calendario",
                                         size: 26,
                                         foregroundColor: .red)
    }
    
    static func createNotas() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "note.text",
                                         imageColor: .white,
                                         title: "Notas",
                                         size: 26,
                                         foregroundColor: .yellow)
    }
    
    static func createRecordatorios() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "list.bullet",
                                         imageColor: .white,
                                         title: "Recordatorios",
                                         size: 22,
                                         foregroundColor: .gray)
    }
    
    static func createNotasVoz() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "waveform.path",
                                         imageColor: .black,
                                         title: "Notas de voz")
    }
    
    static func createTelefono() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "phone.fill",
                                         imageColor: .green,
                                         title: "Teléfono",
                                         size: 20)
    }
    
    static func createMensajes() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "message.fill",
                                         imageColor: .green,
                                         title: "Mensajes")
    }
    
    static func createFaceTime() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "video.fill",
                                         imageColor: .green,
                                         title: "FaceTime")
    }
    
    static func createSafari() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "safari.fill",
                                         imageColor: .white,
                                         title: "Safari",
                                         size: 22,
                                         foregroundColor: .cyan)
    }
    
    static func createBolsa() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "chart.line.uptrend.xyaxis",
                                         imageColor: .black,
                                         title: "Bolsa",
                                         size: 22)
    }
    
    static func createClima() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "cloud.sun.fill",
                                         imageColor: .cyan,
                                         title: "Clima")
    }
    
    static func createTraducir() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "globe",
                                         imageColor: .black,
                                         title: "Traducir")
    }
    
    static func createMaps() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "map.fill",
                                         imageColor: .green,
                                         title: "Mapas")
    }
    
    static func createBrujula() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "location.north.circle",
                                         imageColor: .black,
                                         title: "Brújula",
                                         size: 20)
    }
    
    static func createMedicion() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "ruler",
                                         imageColor: .black,
                                         title: "Medición",
                                         size: 22)
    }
    
    static func createAtajos() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "square.3.layers.3d.bottom.filled",
                                         imageColor: .indigo,
                                         title: "Atajos",
                                         size: 22)
    }
    
    static func createSalud() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "heart.fill",
                                         imageColor: .white,
                                         title: "Salud",
                                         foregroundColor: .red)
    }
}
