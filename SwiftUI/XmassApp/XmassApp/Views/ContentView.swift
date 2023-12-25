//
//  ContentView.swift
//  XmassApp
//
//  Created by pablo borquez on 25/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            if self.isXmass() {
                Text("🎅🎄🥳")
                    .fontSystemRounded(.largeTitle)
                Text("Merry Xmass \(self.getCurrentYear())")
                    .fontSystemRounded(.largeTitle)
                    .fontWeight(.bold)
            } else {
                Text("Waiting for Xmass 👨‍💻")
            }
        }
    }
    
    // MARK: - private
    
    private func isXmass() -> Bool {
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MM"
        
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "dd"
        
        let date = Date()
        
        return monthFormatter.string(from: date) == "12" &&
            dayFormatter.string(from: date) == "25"
    }
    
    private func getCurrentYear() -> String {
        let yearFormatter = DateFormatter()
        yearFormatter.dateFormat = "yyyy"
        
        return yearFormatter.string(from: Date())
    }
}

#Preview {
    ContentView()
}
