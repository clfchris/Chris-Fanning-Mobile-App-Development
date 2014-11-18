//
//  ViewController.swift
//  locationLab11
//
//  Created by Christopher Lynn Fanning on 11/13/14.
//  Copyright (c) 2014 Christopher Lynn Fanning. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var annotation = MKPointAnnotation()
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var span = MKCoordinateSpanMake(0.05, 0.05) //defines area spanned by a map region
        var region = MKCoordinateRegion(center: manager.location.coordinate, span: span) //region of map pto be displayed
        mapView.setRegion(region, animated: true)
        annotation.coordinate=manager.location.coordinate
        annotation.title="You are here"
        annotation.subtitle = "Latitude: \(manager.location.coordinate.latitude), Longitude: \(manager.location.coordinate.longitude)"
        mapView.addAnnotation(annotation)
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        locationManager.startUpdatingLocation() //starts location manager
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        var errorType=String()
        if let clError=CLError(rawValue: error.code){
            if clError == .Denied {
                errorType="access denied"
                let alert=UIAlertController(title: "Error", message: errorType, preferredStyle: UIAlertControllerStyle.Alert)
                let okAction:UIAlertAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        mapView.mapType=MKMapType.Hybrid
        var status:CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        if status==CLAuthorizationStatus.NotDetermined{
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.delegate=self
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.distanceFilter=kCLDistanceFilterNone
        mapView.showsUserLocation=true
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

