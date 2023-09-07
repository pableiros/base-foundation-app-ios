//
//  DayPicker.swift
//  OnThisDay
//
//  Created by pablo borquez on 05/09/23.
//

import SwiftUI

struct DayPicker: View {
    @EnvironmentObject var appState: AppState
    
    @SceneStorage("selectedDate") var selectedDate: String?
    
    @State private var month = "January"
    @State private var day = 1
    
    var maxDays: Int {
        switch self.month {
        case "February":
            return 29
        case "April", "June", "September", "November":
            return 30
        default:
            return 31
        }
    }
    
    var body: some View {
        VStack {
            Text("Select a Date")
            
            HStack {
                Picker("", selection: self.$month) {
                    ForEach(self.appState.englishMonthNames, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                
                Picker("", selection: self.$day) {
                    ForEach(1...self.maxDays, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.menu)
                .frame(maxWidth: 60)
                .padding(.trailing, 10)
            }
            
            if self.appState.isLoading {
                ProgressView()
                    .frame(height: 28)
            } else {
                Button("Get Events") {
                    Task {
                        await self.getNewEvents()
                    }
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
        }
        .padding()
    }
    
    func getNewEvents() async {
        let monthIndex = self.appState.englishMonthNames.firstIndex(of: self.month) ?? 0
        let monthNumber = monthIndex + 1
        
        await self.appState.getDataFor(month: monthNumber, day: self.day)
        
        self.selectedDate = "\(self.month) \(self.day)"
    }
}
