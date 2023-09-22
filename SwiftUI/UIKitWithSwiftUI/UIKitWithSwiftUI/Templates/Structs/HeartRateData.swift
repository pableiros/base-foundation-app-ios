//
//  HeartRateData.swift
//  UIKitWithSwiftUI
//
//  Created by pablo borquez on 21/09/23.
//

import Foundation

struct HeartRateData {
    var samples = [HeartRateSample]()
    var latestSample: HeartRateSample {
        samples.first!
    }
    
    static func generateRandomData(quantity: Int) -> [HeartRateData] {
        var data = [HeartRateData]()
        
        for _ in 0..<quantity {
            var heartRateData = HeartRateData()
            let now = Date()
            let bpmRange = 60...120
            var currentBPM = Int.random(in: bpmRange)
        
            for index in 0...6 {
                let time = Calendar.current.date(byAdding: .minute, value: -index, to: now)!
                let sample = HeartRateSample(id: UUID(), time: time, beatsPerMinute: currentBPM)
                heartRateData.samples.append(sample)
            
                let delta = Int.random(in: -10...10)
                currentBPM = max(bpmRange.lowerBound, min(bpmRange.upperBound, currentBPM + delta))
            }
            data.append(heartRateData)
        }
        
        return data
    }
}
