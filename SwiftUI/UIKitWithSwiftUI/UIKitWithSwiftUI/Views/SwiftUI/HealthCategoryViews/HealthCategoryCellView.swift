//
//  HealthCategoryCellView.swift
//  UIKitWithSwiftUI
//
//  Created by pablo borquez on 25/09/23.
//

import SwiftUI

struct HealthCategoryCellView: View {
    var healthCategory: HealthCategory
    
    private var properties: HealthCategoryProperties {
        self.healthCategory.properties
    }
    
    var body: some View {
        HStack {
            Label(self.properties.name, systemImage: self.properties.systemImageName)
                .foregroundStyle(self.properties.color)
                .font(.system(.headline, weight: .bold))
            Spacer()
        }
    }
}
