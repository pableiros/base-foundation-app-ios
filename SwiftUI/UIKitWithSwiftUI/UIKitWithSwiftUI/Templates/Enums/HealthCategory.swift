//
//  HealthCategory.swift
//  UIKitWithSwiftUI
//
//  Created by pablo borquez on 25/09/23.
//

import Foundation

enum HealthCategory: CaseIterable {
    case activity
    case bodyMeasurement
    case hearing
    case heart
    
    var properties: HealthCategoryProperties {
        switch self {
        case .activity:
            return .init(name: "Activity", systemImageName: "flame.fill", color: .orange)
        case .bodyMeasurement:
            return .init(name: "Body Measurements", systemImageName: "figure.stand", color: .purple)
        case .hearing:
            return .init(name: "Hearing", systemImageName: "ear", color: .blue)
        case .heart:
            return .init(name: "Heart", systemImageName: "heart.fill", color: .pink)
        }
    }
}
