//
//  ViewController.swift
//  Where Was I
//
//  Created by Peter Leung on 7/8/2016.
//  Copyright © 2016 winandmac Media. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        if let oldPoint = DataStore().GetLastLocation() {
            let annot = MKPointAnnotation()
            annot.coordinate.latitude = Double(oldPoint.latitude)!
            annot.coordinate.longitude = Double(oldPoint.longitude)!
            
            annot.title = "I was here"
            annot.subtitle = "ok"
            mapView.addAnnotation(annot)
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            print("Location Not Enabled")
            return
        }
        
        mapView.showsUserLocation = true
        
        
    }

    @IBAction func saveButton(_ sender: AnyObject) {
        let coordinates = locationManager.location?.coordinate
        
        if let lat = coordinates?.latitude {
            if let long = coordinates?.longitude{
                DataStore().StoreDataPoint(latitude: String(lat), longitude: String(long))
            }
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

