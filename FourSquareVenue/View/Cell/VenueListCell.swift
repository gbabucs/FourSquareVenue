//
//  VenueListCell.swift
//  FourSquareVenue
//
//  Created by ThunderFlash on 09/08/2019.
//  Copyright © 2019 system. All rights reserved.
//

import UIKit

class VenueListCell: UITableViewCell {
    
    //--------------------------------------------------------------------------
    // MARK: - IBOutlet
    //--------------------------------------------------------------------------
    
    @IBOutlet weak var venueName: UILabel!
    @IBOutlet weak var distance: UILabel!
    
}

//--------------------------------------------------------------------------
// MARK: - Cell
//--------------------------------------------------------------------------

extension VenueListCell: Cell {
    
    func configure(for item: Venue) {
        venueName.text = item.name
        distance.text = "\(String(describing: item.location?.distance ?? 0)) m"
    }
}
