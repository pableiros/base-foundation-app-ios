//
//  HeartRateSample.swift
//  UIKitWithSwiftUI
//
//  Created by pablo borquez on 21/09/23.
//

import Foundation

struct HeartRateSample: Identifiable {
    let id: UUID
    var time: Date
    var beatsPerMinute: Int
}
