//
//  ContentView.swift
//  ListSwiftUI
//
//  Created by pablo borquez
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<15, id: \.self) {
                Text("Row: \($0)")
            }
            .listStyle(.plain)
            .navigationTitle("SwiftUI List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
