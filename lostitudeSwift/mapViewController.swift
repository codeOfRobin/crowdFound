//
//  mapViewController.swift
//  lostitudeSwift
//
//  Created by Robin Malhotra on 26/07/15.
//  Copyright © 2015 Robin Malhotra. All rights reserved.
//

import UIKit
import MapKit
class mapViewController: UIViewController {
    var latitude = 51.50007773
    var longitude = -0.1246402
    let mapView = MKMapView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        mapView.frame=view.frame
        view.addSubview(mapView)
        let location = CLLocationCoordinate2D(
            latitude: latitude,
            longitude:longitude
        )
        print(location)
        // 2
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        //3
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Big Ben"
        annotation.subtitle = "London"
        mapView.addAnnotation(annotation)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
