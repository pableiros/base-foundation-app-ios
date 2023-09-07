//
//  DateButtonViewModifier.swift
//  OnThisDay
//
//  Created by pablo borquez on 05/09/23.
//

import SwiftUI

struct DateButtonViewModifier: ViewModifier {
    var selected: Bool
    
    func body(content: Content) -> some View {
        if self.selected {
            content
                .buttonStyle(.borderedProminent)
        } else {
            content
        }
    }
}
