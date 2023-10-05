//
//  AirportModel.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import Foundation
import os.log

@MainActor
class AirportModel: ObservableObject {
    let logger = Logger(subsystem: "com.example.apple-samplecode.FlightPlanner.AirportData", category: "Model")
    
    @Published private(set) var airports: [Airport]
    
    init(airports: [Airport] = []) {
        self.airports = airports
    }
    
    private let store = Store()
    
    func load() async {
        self.airports = await self.store.load()
    }
}

extension AirportModel {
    private actor Store {
        let logger = Logger(subsystem: "com.example.apple-samplecode.FlightPlanner.AirportData.Store", category: "ModelIO")
        
        func load() -> [Airport] {
            self.load(from: .main)
        }
        
        private func load(from bundle: Bundle) -> [Airport] {
            self.logger.debug("Loading the data from disk.")
            
            var airports: [Airport]
            do {
                let data = try Data(contentsOf: Store.dataURL, options: .mappedIfSafe)
                airports = try JSONDecoder().decode([Airport].self, from: data)
                
                self.logger.debug("Data loaded from disk.")
            } catch CocoaError.fileReadNoSuchFile {
                self.logger.debug("No file found -- creating an empty airport list.")
                airports = []
            } catch {
                self.logger.error("*** An error occurred while loading the airport list: \(error.localizedDescription) ***")
                fatalError()
            }

            return airports
        }
        
        fileprivate static var dataURL: URL {
            get throws {
                let bundle = Bundle.main

                guard let path = bundle.path(forResource: "Airports", ofType: "json") else {
                    throw CocoaError(.fileReadNoSuchFile)
                }

                return URL(fileURLWithPath: path)
            }
        }
    }
}
