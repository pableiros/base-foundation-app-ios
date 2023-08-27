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
    
    init(systemImage: String, imageColor: Color, title: String) {
        self.systemImage = systemImage
        self.imageColor = imageColor
        self.title = title
    }
    
    static func createRedCelular() -> SettingsTitleRowContainer {
        return SettingsTitleRowContainer(systemImage: "antenna.radiowaves.left.and.right",
                                         imageColor: .green,
                                         title: "Red celular")
    }
}
