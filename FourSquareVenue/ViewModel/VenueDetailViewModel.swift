//
//  VenueDetailViewModel.swift
//  FourSquareVenue
//
//  Created by ThunderFlash on 09/08/2019.
//  Copyright © 2019 system. All rights reserved.
//

import Foundation

class VenueDetailViewModel: NSObject {
    
    //--------------------------------------------------------------------------
    // MARK: - Properties
    //--------------------------------------------------------------------------
    
    var venue: Venue?
    
    var name: String? {
        return venue?.name
    }
    
    var fullAddress: String? {
        return venue?.location?.formattedAddress?.joined(separator: ", ")
    }
    
    //--------------------------------------------------------------------------
    // MARK: - Methods
    //--------------------------------------------------------------------------
    
    init(with venue: Venue) {
        self.venue = venue
    }
}
