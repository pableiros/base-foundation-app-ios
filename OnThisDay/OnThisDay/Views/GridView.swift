//
//  GridView.swift
//  OnThisDay
//
//  Created by pablo borquez on 24/08/23.
//

import SwiftUI

struct GridView: View {
    var gridData: [Event]
    
    var columns: [GridItem] {
        return [GridItem(.adaptive(minimum: 250, maximum: 250), spacing: 20)]
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: self.columns, spacing: 15) {
                ForEach(self.gridData) { events in
                    EventView(event: events)
                        .frame(height: 350, alignment: .topLeading)
                        .background()
                        .clipped()
                        .border(.secondary, width: 1)
                        .padding(.bottom, 5)
                        .shadow(color: .primary.opacity(0.3), radius: 3, x: 3, y: 3)
                }
            }
        }
        .padding(.vertical)
    }
}

