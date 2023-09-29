//
//  StepData.swift
//  UIKitWithSwiftUI
//
//  Created by pablo borquez on 29/09/23.
//

import Foundation

struct StepData: Identifiable {
    let id: UUID
    var date: Date
    var stepCount: Int
    
    static func generateRandomData(days: Int) -> [StepData] {
        var data = [StepData]()
        let today = Date()
        
        for index in 0..<days {
            let date = Calendar.current.date(byAdding: .day, value: -index, to: today)!
            let stepCount = Int.random(in: 500...25_000)
        
            data.append(StepData(id: UUID(), date: date, stepCount: stepCount))
        }
        
        return data
    }
}
