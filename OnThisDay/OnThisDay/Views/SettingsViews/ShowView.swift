//
//  ShowView.swift
//  OnThisDay
//
//  Created by pablo borquez on 06/09/23.
//

import SwiftUI

struct ShowView: View {
    @AppStorage("showBirths") var showBirths = true
    @AppStorage("showDeaths") var showDeaths = true
    @AppStorage("showTotals") var showTotals = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Toggle("Show Births", isOn: self.$showBirths)
            Toggle("Show Deaths", isOn: self.$showDeaths)
            Toggle("Show Totals", isOn: self.$showTotals)
        }
    }
}

struct ShowView_Previews: PreviewProvider {
    static var previews: some View {
        ShowView()
            .frame(width: 200, height: 150)
    }
}
