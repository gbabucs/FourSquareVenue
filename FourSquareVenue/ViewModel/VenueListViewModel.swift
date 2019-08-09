//
//  VenueListViewModel.swift
//  FourSquareVenue
//
//  Created by ThunderFlash on 09/08/2019.
//  Copyright © 2019 system. All rights reserved.
//

import Foundation

class VenueListViewModel: NSObject {
    
    //--------------------------------------------------------------------------
    // MARK: - Properties
    //--------------------------------------------------------------------------
    
    private var venues : [Venue]?
    
    var isEmptyVenue: Bool {
        return (venues?.count ?? 0) == 0
    }
    
    //--------------------------------------------------------------------------
    // MARK: - Helpers
    //--------------------------------------------------------------------------
    
    func getVenueList(with params: SearchParameter?, completion: @escaping(_ success: Bool) -> ()) {
        guard let query = params else { return }
        
        DataController().fetchVenues(with: query) { [weak self] venues, success in
            self?.venues = venues
            completion(success)
        }
    }
    
    func numberOfRowsInSection(section : Int) -> Int {
        return venues?.count ?? 0
    }
    
    func selectedObject(indexPath: IndexPath) -> Venue? {
        guard let venue = venues?[indexPath.row]
            else { return nil }
        
        return venue
    }
    
    func update(_ cell: VenueListCell, at indexPath: IndexPath) {
        guard let venue = venues?[indexPath.row]
            else { return }
        
        cell.configure(for: venue)
    }
}
