//
//  PassengersStepper.swift
//  FlightPlanner
//
//  Created by pablo borquez on 12/10/23.
//

import SwiftUI

struct PassengersStepper<Content: View, Label: View>: View {
    @Binding var value: Int
    
    var content: Content
    var label: Label
    
    private let min = 0
    private let max = 8
    
    init(value: Binding<Int>,
        @ViewBuilder content: () -> Content,
        @ViewBuilder label: () -> Label) {
        _value = value
        self.content = content()
        self.label = label()
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                self.content
            }
            
            Spacer()
            
            Stepper {
                self.label
            } onIncrement: {
                guard self.value < self.max else { return }
                
                self.value += 1
            } onDecrement: {
                guard self.value > self.min else { return }
                
                self.value -= 1
            }
        }
    }
}
