//
//  DetailMapView.swift
//  BaseFoundationApp
//
//  Created by pablo borquez on 11/08/23.
//

import SwiftUI
import MapKit

#if os(iOS)
private typealias ViewControllerRepresentable = UIViewControllerRepresentable
#elseif os(macOS)
private typealias ViewControllerRepresentable = NSViewControllerRepresentable
#endif

struct DetailedMapView: ViewControllerRepresentable {
    #if os(iOS)
    typealias ViewController = UIViewController
    #elseif os(macOS)
    typealias ViewController = NSViewController
    #endif
    
    var location: CLLocation
    var distance: Double = 1000
    var pitch: Double = 0
    var heading: Double = 0
    var topSafeAreaInset: Double
    
    class Controller: ViewController {
        var mapView: MKMapView {
            guard let tempView = self.view as? MKMapView else {
                fatalError("View could not be cast as MapView.")
            }
            
            return tempView
        }
        
        override func loadView() {
            let mapView = MKMapView()
            self.prepare(mapView: mapView)
            self.prepareMapConfiguration(mapView: mapView)
        }
        
        // MARK: - private
        
        private func prepare(mapView: MKMapView) {
            self.view = mapView
            #if os(iOS)
            self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            #elseif os(macOS)
            self.view.autoresizingMask = [.width, .height]
            #endif
        }
        
        private func prepareMapConfiguration(mapView: MKMapView) {
            let configuration = MKStandardMapConfiguration(elevationStyle: .realistic,
                                                           emphasisStyle: .default)
            configuration.pointOfInterestFilter = .excludingAll
            configuration.showsTraffic = false
            mapView.preferredConfiguration = configuration
            mapView.isZoomEnabled = false
            mapView.isPitchEnabled = false
            mapView.isScrollEnabled = false
            mapView.isRotateEnabled = false
            mapView.showsCompass = false
        }
    }
    
    #if os(iOS)
    func makeUIViewController(context: Context) -> Controller {
        Controller()
    }
    
    func updateUIViewController(_ controller: Controller, context: Context) {
        self.update(controller: controller)
    }
    #elseif os(macOS)
    func makeNSViewController(context: Context) -> Controller {
        Controller()
    }
    
    func updateNSViewController(_ controller: Controller, context: Context) {
        self.update(controller: controller)
    }
    #endif
    
    func update(controller: Controller) {
        #if os(iOS)
        controller.additionalSafeAreaInsets.top = self.topSafeAreaInset
        #endif
        controller.mapView.camera = MKMapCamera(lookingAtCenter: self.location.coordinate,
                                                fromDistance: self.distance,
                                                pitch: self.pitch,
                                                heading: self.heading
        )
    }
}

struct DetailedMapView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedMapView(location: CLLocation(latitude: 40.689247,
                                             longitude: -74.044502),
                        topSafeAreaInset: 0)
        .ignoresSafeArea()
    }
}
