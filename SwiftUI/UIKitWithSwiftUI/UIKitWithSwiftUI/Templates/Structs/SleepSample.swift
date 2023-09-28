//
//  SleepSample.swift
//  UIKitWithSwiftUI
//
//  Created by pablo borquez on 28/09/23.
//

import Foundation

struct SleepSample: Identifiable {
    let id: UUID
    var date: Date
    var startMinute: Int
    var totalMinutes: Int
    var durationHours: Int {
        self.totalMinutes / 60
    }
    var durationMinutes: Int {
        self.totalMinutes % 60
    }
}
