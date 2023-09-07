//
//  SettingsView.swift
//  SettingsApp
//
//  Created by pablo borquez on 27/08/23.
//

import SwiftUI

struct SettingsView: View {
    @State private var searchText = ""
    @State private var sections = SettingsSectionContainer.createSections()
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    SettingsAccountCell()
                }
                
                ForEach(0..<self.sections.count, id: \.self) { sectionIndex in
                    let settingsSection = self.sections[sectionIndex]
                    
                    Section {
                        ForEach(0..<settingsSection.rows.count, id: \.self) { rowIndex in
                            let settingsRow = settingsSection.rows[rowIndex]
                            
                            if settingsRow is SettingsToggleRowContainer {
                                SettingsCell(self.$sections[sectionIndex].rows[rowIndex])
                            } else {
                                NavigationLink {
                                    Text("Destination")
                                } label: {
                                    SettingsCell(self.$sections[sectionIndex].rows[rowIndex])
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Configuración")
        }
        .searchable(text: $searchText)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}



