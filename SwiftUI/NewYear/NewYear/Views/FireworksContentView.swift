//
//  FireworksView.swift
//  NewYear
//
//  Created by pablo borquez on 29/12/23.
//

import SwiftUI
import EffectsLibrary

struct FireworksContentView: View {
    var body: some View {
        FireworksView(
            config: FireworksConfig(
                content: [
                    .shape(.triangle, .blue, 10.0),
                    .shape(.square, .green, 10.0),
                    .shape(.circle, .red, 10.0),
                    .emoji("🚀", 10.0),
                    .emoji("💥", 3.0)
                ],
                intensity: .high,
                lifetime: .long,
                initialVelocity: .fast,
                fadeOut: .slow
            )
        )
    }
}

#Preview {
    FireworksView()
}
