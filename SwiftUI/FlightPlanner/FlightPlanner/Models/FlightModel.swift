//
//  FlightModel.swift
//  FlightPlanner
//
//  Created by pablo borquez on 05/10/23.
//

import Combine
import Foundation
import os.log

@MainActor
final class FlightModel: ObservableObject {
    let logger = Logger(subsystem: "com.example.apple-samplecode.FlightPlanner.FlightData", category: "Model")
    
    @Published var segments: [FlightSegment] = []
    @Published private var itinerary: [FlightSegment.ID: FlightSegment]
    
    init(itinerary: [FlightSegment] = []) {
        self.itinerary = itinerary.indexed()
        
        self.$itinerary
            .map { $0.values.sorted() }
            .assign(to: &$segments)
    }
    
    private let store = Store()
    
    func addSegment(_ segment: FlightSegment) {
        self.itinerary[segment.id] = segment
        
        Task.detached {
            await self.save()
        }
    }
    
    func removeSegment(_ segment: FlightSegment) {
        self.itinerary[segment.id] = nil
        
        Task.detached {
            await self.save()
        }
    }
    
    func removeLegs(atOffsets offsets: IndexSet, in segment: FlightSegment) {
        guard segment.legs.count > 1 else {
            self.removeSegment(segment)
            return
        }
        
        var legs = segment.legs
        legs.remove(atOffsets: offsets)
        
        guard let updatedSegment = FlightSegment(id: segment.id, legs: legs) else { return }
        
        self.itinerary[segment.id] = updatedSegment
        
        Task.detached {
            await self.save()
        }
    }
    
    func load() async {
        self.itinerary = await self.store.load().indexed()
    }
    
    func save() async {
        self.logger.debug("Updating the system based on the current `segments` property.")
        await self.store.save(segments)
    }
}

extension FlightModel {
    private actor Store {
        let logger = Logger(subsystem: "com.example.apple-samplecode.FlightPlanner.FlightData.Store", category: "ModelIO")
        
        private var savedItinerary: [FlightSegment] = []
        
        func load() -> [FlightSegment] {
            self.load(from: .main)
        }
        
        private func load(from bundle: Bundle) -> [FlightSegment] {
            self.logger.debug("Loading the data from disk.")
            
            var itinerary: [FlightSegment]
            
            do {
                let data = try Data(contentsOf: dataURL, options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let segmentType = [FlightSegment].self
                let segments = try decoder.decode(segmentType, from: data)
                
                itinerary = segments.sorted()
            } catch CocoaError.fileReadNoSuchFile {
                self.logger.debug("No file found -- creating an empty flight itinerary list.")
                itinerary = []
            } catch {
                self.logger.error("*** An error occurred while loading the flight data: \(error.localizedDescription) ***")
                fatalError()
            }
            
            self.savedItinerary = itinerary
            
            return itinerary
        }
        
        func save(_ itinerary: [FlightSegment]) {
            if itinerary == self.savedItinerary {
                logger.debug("The flight itinerary data hasn't changed. No need to save.")
                return
            }
            
            let data: Data
            
            do {
                data = try JSONEncoder().encode(itinerary)
            } catch {
                self.logger.error("An error occurred while encoding the flight itinerary data: \(error.localizedDescription)")
                return
            }
            
            do {
                self.logger.debug("Asynchronously saving the flight itinerary data on a background thread.")
                try data.write(to: dataURL, options: [.atomic])
                
                self.savedItinerary = itinerary
                
                self.logger.debug("Flight itinerary data saved!")
            } catch {
                self.logger.error("An error occurred while saving the flight itinerary data: \(error.localizedDescription)")
            }
        }
        
        private var dataURL: URL {
            get throws {
                try FileManager.default.url(for: .documentDirectory,
                                            in: .userDomainMask,
                                            appropriateFor: nil,
                                            create: false)
                .appendingPathComponent("Flights.json")
            }
        }
    }
}

extension Sequence where Element: Identifiable {
    fileprivate func indexed() -> [Element.ID: Element] {
        Dictionary(uniqueKeysWithValues: self.lazy.map { ($0.id, $0) })
    }
}
