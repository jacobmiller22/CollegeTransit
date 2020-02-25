//
//  MapView.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/1/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    
    @EnvironmentObject var fetcher: BusFetcher
    @Binding var annotations: [MKPointAnnotation]
    
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
        
        mapView.showsUserLocation = true
        let locationManager = CLLocationManager()
        let status = CLLocationManager.authorizationStatus()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()

        if status == .authorizedAlways || status == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            let location: CLLocationCoordinate2D = locationManager.location!.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
        }
        mapView.showsScale = true
        mapView.showsTraffic = true
        mapView.mapType = MKMapType.mutedStandard
        mapView.isPitchEnabled = false
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
        let allAnnotations = view.annotations
        view.removeAnnotations(allAnnotations)
        view.addAnnotations(annotations)
        
    }
    
}
