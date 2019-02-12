//
//  ViewController.swift
//  Mapping101
//
//  Created by Guled Ali on 2/6/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate  {
    
    var mapView: MKMapView!
    
    override func loadView() {
        super.loadView()
        mapView = MKMapView()
        view = mapView
        addSegmentedControl()
        
    }
    

  

    
    //Adding segmented control that switch the map to three types of mode: Standard, Hybrid, Satellite
    
    func addSegmentedControl() {
    
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
         let topContstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trainlingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
       
     
       
        
       
        topContstraint.isActive = true
        leadingConstraint.isActive = true
        trainlingConstraint.isActive = true
}
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    

    
    
}

