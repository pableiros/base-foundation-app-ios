//
//  CityView.swift
//  BaseFoundationApp
//
//  Created by pablo borquez on 25/08/23.
//

import SwiftUI
import BaseFoundationiOS

struct CityView: View {
    @State private var spotSelected = ParkingSpot.applePark
    
    var body: some View {
        NavigationStack {
            VStack {
                ParkingSpotShowcaseView(spot: self.spotSelected,
                                        topSafeAreaInset: 0)
            }
            .pickerToolbar { (cityType: CityType) in
                switch cityType {
                case .apple:
                    self.spotSelected = .applePark
                case .statueLiberty:
                    self.spotSelected = .statueLiberty
                case .oneWTC:
                    self.spotSelected = .oneWorldTradeCenter
                case .goldenGate:
                    self.spotSelected = .goldenGateBridge
                case .eiffelTower:
                    self.spotSelected = .eiffelTower
                }
            }
            .navigationTitle("Location")
        }
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView()
    }
}
