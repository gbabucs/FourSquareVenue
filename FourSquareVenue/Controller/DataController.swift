//
//  DataController.swift
//  FourSquareVenue
//
//  Created by ThunderFlash on 09/08/2019.
//  Copyright © 2019 system. All rights reserved.
//

import Foundation
import UIKit

class DataController: NSObject {
    
    //--------------------------------------------------------------------------
    // MARK: - Fetch Venue
    //--------------------------------------------------------------------------
    
    func fetchVenues(with query: SearchParameter, completion: @escaping([Venue]?, _ success: Bool) -> Void) {
        var venues = [Venue]()
        
        DataAdapter.shared.fetchPlaces(query: query) { isSuccess, places in
            
            if isSuccess {
                let items = places?.response?.groups?.first?.items.map { $0 }
                
                items?.forEach { item in
                    if let venue = item.venue {
                        venues.append(venue)
                    }
                }
            }
            
            completion(self.sortedByDistance(venues: venues), isSuccess)
        }
    }
    
    //--------------------------------------------------------------------------
    // MARK: - Helpers
    //--------------------------------------------------------------------------
    
    func sortedByDistance(venues: [Venue]) -> [Venue] {
        return venues.sorted(by: { $0.location?.distance ?? 0 < $1.location?.distance ?? 0 })
    }
}
