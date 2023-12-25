//
//  ViewExtension.swift
//  XmassApp
//
//  Created by pablo borquez on 25/12/23.
//

import SwiftUI

extension View {
    func fontSystemRounded(_ style: Font.TextStyle) -> some View {
        return self.font(.system(style, design: .rounded))
    }
}
