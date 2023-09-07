//
//  PreferencesView.swift
//  OnThisDay
//
//  Created by pablo borquez on 06/09/23.
//

import SwiftUI

struct PreferencesView: View {
    var body: some View {
        TabView {
            ShowView()
                .tabItem {
                    Image(systemName: "checkmark.circle")
                    Text("Show")
                }
            
            Text("Tab 2 content here")
                .tabItem {
                    Image(systemName: "sun.min")
                    Text("Appearance")
                }
        }
        .frame(width: 250, height: 150)
        
            .navigationTitle("Settings")
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
