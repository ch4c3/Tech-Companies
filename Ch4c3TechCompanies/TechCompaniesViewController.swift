//
//  TechCompaniesViewController.swift
//  Ch4c3TechCompanies
//
//  Created by Candace Hicks on 10/10/16.
//  Copyright © 2016 Candace Hicks. All rights reserved.
//
import MapKit
import UIKit

class TechCompaniesViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    var company: Company?
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.mapType = MKMapType.hybrid
        
        if let company = company{
            
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(company.lat, company.lon)
        annotation.title = company.name
        let latitude = String(company.lat)
        let longitude = String(company.lon)
        
        let location =  latitude + "," +  longitude
            
        annotation.subtitle = location
            
        mapView.addAnnotation(annotation)
        
        
        }
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}*/
}
