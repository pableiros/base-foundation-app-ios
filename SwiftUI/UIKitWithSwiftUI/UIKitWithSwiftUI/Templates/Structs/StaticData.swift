//
//  StaticData.swift
//  UIKitWithSwiftUI
//
//  Created by pablo borquez on 21/09/23.
//

import Foundation

struct StaticData {
    lazy var heartRateItems = HeartRateData.generateRandomData(quantity: 3)
    lazy var healthCategories = HealthCategory.allCases
    lazy var sleepItems = SleepData.generateRandomData(quantity: 4)
    lazy var stepItems = StepData.generateRandomData(days: 7)
}
