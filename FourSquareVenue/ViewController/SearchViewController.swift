//
//  SearchViewController.swift
//  FourSquareVenue
//
//  Created by ThunderFlash on 09/08/2019.
//  Copyright © 2019 system. All rights reserved.
//

import UIKit
import MapKit

class SearchViewController: UIViewController {
    
    //--------------------------------------------------------------------------
    // MARK: - IBOutlet
    //--------------------------------------------------------------------------
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var radius: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    
    //--------------------------------------------------------------------------
    // MARK: - Properties
    //--------------------------------------------------------------------------
    
    var locationManager: CLLocationManager!
    var currentLocation: CLLocation?
    var queryParams = SearchParameter()
    
    //--------------------------------------------------------------------------
    // MARK: - LifeCycle functions
    //--------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Search Venue"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        determineCurrentLocation()
    }
    
    //--------------------------------------------------------------------------
    // MARK: - IBActions
    //--------------------------------------------------------------------------
    
    @IBAction func searchButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "showVenueListViewController", sender: nil)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        
        radius.text = "\(currentValue)"
        
        guard currentValue > 0 else { return }
        queryParams.radius = currentValue
    }
    
    //--------------------------------------------------------------------------
    // MARK: - Helpers
    //--------------------------------------------------------------------------
    
    func determineCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    //--------------------------------------------------------------------------
    // MARK: - Navigation
    //--------------------------------------------------------------------------
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showVenueListViewController",
            let venueListViewController = segue.destination as? VenueListViewController
            else { return }
        venueListViewController.queryParams = queryParams
        
    }
}

//--------------------------------------------------------------------------
// MARK: - CLLocationManagerDelegate
//--------------------------------------------------------------------------

extension SearchViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let mostRecentLocation = locations.last
            else { return }
        
        queryParams.latitude = mostRecentLocation.coordinate.latitude
        queryParams.longitude = mostRecentLocation.coordinate.longitude
    }
}


