//
//  SleepData.swift
//  UIKitWithSwiftUI
//
//  Created by pablo borquez on 28/09/23.
//

import Foundation

struct SleepData {
    var samples = [SleepSample]()
    var latestSample: SleepSample {
        samples.first!
    }
    
    static func generateRandomData(quantity: Int) -> [SleepData] {
        var data = [SleepData]()
        
        for _ in 0..<quantity {
            var sleepData = SleepData()
            let today = Date()
        
            for index in 0...8 {
                let date = Calendar.current.date(byAdding: .day, value: -index, to: today)!
                let start = Int.random(in: 20...23) * 60 + Int.random(in: 0...59)
                let duration = Int.random(in: 6...9) * 60 + Int.random(in: 0...59)
                let sample = SleepSample(id: UUID(), 
                                         date: date,
                                         startMinute: start,
                                         totalMinutes: duration)
            
                sleepData.samples.append(sample)
            }
            
            data.append(sleepData)
        }
        
        return data
    }
}
