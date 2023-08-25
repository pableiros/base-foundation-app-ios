//
//  City.swift
//  BaseFoundationApp
//
//  Created by pablo borquez on 25/08/23.
//

import Foundation
import BaseFoundationiOS

enum CityType: Int, PickerToolbarType {
    var id: Self { self }

    case apple = 1
    case statueLiberty = 2
    case oneWTC = 3
    case goldenGate = 4
    case eiffelTower = 5
    
    var value: String {
        let value: String
        
        switch self {
        case .apple:
            value = "Apple"
        case .statueLiberty:
            value = "Statue of Liberty"
        case .oneWTC:
            value = "One WTC"
        case .goldenGate:
            value = "Golden Gate"
        case .eiffelTower:
            value = "Eiffel Tower"
        }
        
        return value
    }
    
    static var firstCase: CityType { return .apple }
}
