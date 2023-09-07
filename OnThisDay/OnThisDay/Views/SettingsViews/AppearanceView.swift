//
//  AppearanceView.swift
//  OnThisDay
//
//  Created by pablo borquez on 06/09/23.
//

import SwiftUI

struct AppearanceView: View {
    @AppStorage("displayMode") var displayMode = DisplayMode.auto
    
    var body: some View {
        Picker("", selection: self.$displayMode) {
            Text("Light")
                .tag(DisplayMode.light)
            
            Text("Dark")
                .tag(DisplayMode.dark)
            
            Text("Automatic")
                .tag(DisplayMode.auto)
        }
        .pickerStyle(.radioGroup)
    }
}

struct AppearanceView_Previews: PreviewProvider {
    static var previews: some View {
        AppearanceView()
            .frame(width: 200, height: 150)
    }
}
